# BSC Bytecode Decompiler

Decompile binance smart chain contracts from bytecode. 

You will need to set the env variable:

```
export BSCSCAN_API_KEY='YOUR BSC SCAN API KEY'
```

# Example:

```
python3.9 panoramix.py 0xcc598232a75fB1B361510Bce4Ca39d7bC39cf498
```

```
def storage:
  stor0 is uint256 at storage 0
  stor1 is array of uint256 at storage 1
  stor8 is array of addr at storage 8
  stor9 is addr at storage 9
  stor10 is array of addr at storage 10

def _fallback() payable: # default function
  revert

def withdrawTokens(address _tokenAddress, uint256 _amount) payable:
  require calldata.size - 4 >= 64
  if not _tokenAddress:
      if _amount > 0:
          call 0xa0acc61547f6bd066f7c9663c17a312b6ad7e187 with:
             value _amount wei
               gas gas_remaining wei
      else:
          call 0xa0acc61547f6bd066f7c9663c17a312b6ad7e187 with:
             value eth.balance(0xa0acc61547f6bd066f7c9663c17a312b6ad7e187) wei
               gas gas_remaining wei
  else:
      require ext_code.size(_tokenAddress)
      if _amount:
          call _tokenAddress.transfer(address to, uint256 value) with:
               gas gas_remaining wei
              args 0xa0acc61547f6bd066f7c9663c17a312b6ad7e187, _amount
      else:
          static call _tokenAddress.balanceOf(address owner) with:
                  gas gas_remaining wei
                 args this.address
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          require ext_code.size(_tokenAddress)
          call _tokenAddress.transfer(address to, uint256 value) with:
               gas gas_remaining wei
              args 0xa0acc61547f6bd066f7c9663c17a312b6ad7e187, ext_call.return_data[0]
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32
  require caller == 0xa0acc61547f6bd066f7c9663c17a312b6ad7e187
```
^Output cut off as it was too long



## Installation:

```
git clone https://github.com/eveem-org/panoramix.git
pip3 install -r requirements.txt
```

## Running:

You *need* **python3.8** to run Panoramix. Yes, there was no way around it.

```
python3.8 panoramix.py address [func_name] [--verbose|--silent|--explain]
```

e.g.

```
python3.8 panoramix.py 0x06012c8cf97bead5deae237070f9587f8e7a266d
```
or
```
python3.8 panoramix.py kitties
```

Output goes to two places:
- `console`
- ***`cache_pan/`*** directory - .pan, .json, .asm files

If you want to see how Panoramix works under the hood, try the `--explain` mode:

```
python3.8 panoramix.py kitties paused --explain
python3.8 panoramix.py kitties pause --explain
python3.8 panoramix.py kitties tokenMetadata --explain
```

### Optional parameters:

func_name -- name of the function to decompile (note: storage names won't be discovered in this mode)
--verbose -- prints out the assembly and stack as well as regular functions, a good way to try it out is
by running 'python panoramix.py kitties pause --verbose' - it's a simple function

There are more parameters as well. You can find what they do in panoramix.py.

### Address shortcuts
Some contract addresses, which are good for testing, have shortcuts, e.g. you can run
'python panoramix.py kitties' instead of 'python3 panoramix.py 0x06012c8cf97bead5deae237070f9587f8e7a266d'.

See panoramix.py for the list of shortcuts, feel free to add your own.

## Directories & Files

### Code:
- core - modules for doing abstract/symbolic operations
- pano - the proper decompiler
- utils - various helper modules
- tilde - the library for handling pattern matching in python3.8

### Data:
- cache_code - cached bytecodes
- cache_pan - cached decompilation outputs
- cache_pabi - cached auto-generated p-abi files
- supplement.db - sqlite3 database of function definitions
- supp2.db - a lightweight variant o the above

Cache directories are split into subdirectories, so the filesystem doesn't break down with large amounts
of cached contracts (important when running bulk_decompile on all 2.2M contracts on the chain)

All of the above generated after the first run.

## Utilities
bulk_decompile.py - batch-decompiles contracts, with multi-processing support
bulk_compare.py - decompiles a set of test contracts, fetches the current decompiled from Eveem, and prepares two files, so you can diff them and see what changes were made

## Why **python3.8** and **Tilde**
Panoramix uses a ton of pattern matching operations, and python doesn't support those as a language.

There are some pattern-matching libraries for older python versions, but none of them seemed good enough.
Because of that, I built Tilde, which is a language extension adding a new operator.

Tilde replaces '~' pattern matching operator with a series of ':=' operators underneath.
Because of that, python3.8 is a must.

Believe me, I spent a lot of time looking for some other way to make pattern matching readable.
Nothing was close to this good.

But if you manage to figure out a way to do it without Tilde (and maintain readability), I'll gladly accept a PR :)

# How Panoramix works

See the source code comments, starting with panoramix.py. Also, those slides[tbd].

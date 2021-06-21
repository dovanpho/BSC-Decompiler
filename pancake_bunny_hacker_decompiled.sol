# https://www.cointribune.com/en/columns/the-defi-column/has-pancake-bunny-fallen-victim-to-a-1-billion-hack/

#
#  Panoramix 17 Feb 2020
#
#
#  I failed with these:
#  - unknownee872558(?)
#  All the rest is below.
#

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

def init() payable:
  require ext_code.size(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c)
  call 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.transferFrom(address from, address to, uint256 value) with:
       gas gas_remaining wei
      args caller, addr(this.address), 10^18
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_code.size(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c)
  call 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.approve(address spender, uint256 value) with:
       gas gas_remaining wei
      args 0xdc2bbb0d33e0e7dea9f5b98f46edbac823586a0c, 10^18
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_code.size(0xdc2bbb0d33e0e7dea9f5b98f46edbac823586a0c)
  call 0xdc2bbb0d33e0e7dea9f5b98f46edbac823586a0c.0x1c4009f9 with:
       gas gas_remaining wei
      args 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c, 10^18, 0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require ext_code.size(0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae)
  static call 0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae.balanceOf(address owner) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_code.size(0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae)
  call 0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae.approve(address spender, uint256 value) with:
       gas gas_remaining wei
      args 0x633e538ecf0bee1a18c2edfe10c4da0d6e71e77b, ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_code.size(0x633e538ecf0bee1a18c2edfe10c4da0d6e71e77b)
  call 0x633e538ecf0bee1a18c2edfe10c4da0d6e71e77b.deposit(uint256 term) with:
       gas gas_remaining wei
      args ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require caller == 0xa0acc61547f6bd066f7c9663c17a312b6ad7e187

def unknown8566270b(uint256 _param1, array _param2, uint256 _param3) payable:
  require calldata.size - 4 >= 96
  require _param2 <= 4294967296
  require _param2 + 36 <= calldata.size
  require _param2.length <= 4294967296 and _param2 + _param2.length + 36 <= calldata.size
  mem[128 len _param2.length] = _param2[all]
  mem[_param2.length + 128] = 0
  stor0 = _param1
  require ext_code.size(0x633e538ecf0bee1a18c2edfe10c4da0d6e71e77b)
  static call 0x633e538ecf0bee1a18c2edfe10c4da0d6e71e77b.0x8cc262 with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_call.return_data[0] > 0
  require ext_code.size(stor9)
  static call stor9.0xdfe1681 with:
          gas gas_remaining wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_code.size(stor9)
  if ext_call.return_data[12 len 20] != 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c:
      static call stor9.token1() with:
              gas gas_remaining wei
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32
      require ext_call.return_data[12 len 20] == 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c
  static call stor9.getReserves() with:
          gas gas_remaining wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 96
  mem[ceil32(_param2.length) + 160] = 0
  mem[ceil32(_param2.length) + 128] = 32
  mem[ceil32(_param2.length) + 260] = this.address
  mem[ceil32(_param2.length) + 292] = 128
  mem[ceil32(_param2.length) + 324] = 0, 32
  mem[ceil32(_param2.length) + 356 len ceil32(0, 32)] = 0, mem[ceil32(_param2.length) + 192 len ceil32(0, 32) - 32]
  require ext_code.size(stor9)
  call stor9.0x22c0d9f with:
       gas gas_remaining wei
      args mem[ceil32(_param2.length) + 196 len 0, 32 + 160]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require ext_code.size(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c)
  static call 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.balanceOf(address owner) with:
          gas gas_remaining wei
         args this.address
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ext_call.return_data[0] > 100000 * 10^18
  require ext_code.size(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c)
  call 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.transfer(address to, uint256 value) with:
       gas gas_remaining wei
      args 0xa0acc61547f6bd066f7c9663c17a312b6ad7e187, ext_call.return_data[0]
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  mem[ceil32(_param2.length) + 224] = tx.origin
  mem[ceil32(_param2.length) + 244 len floor32(_param2.length)] = call.data[_param2 + 36 len floor32(_param2.length)]
  mem[ceil32(_param2.length) + floor32(_param2.length) + -(_param2.length % 32) + 276 len _param2.length % 32] = mem[floor32(_param2.length) + -(_param2.length % 32) + 160 len _param2.length % 32]
  mem[_param2.length + ceil32(_param2.length) + 244] = _param3
  require sha3(tx.origin, mem[ceil32(_param2.length) + 244 len 12], ext_call.return_data[28 len 4], mem[ceil32(_param2.length) + 260 len _param2.length + 16]) == 0x20d515acbac2c5035ca7ea087e8f96fdd0d104e5ef6c2c406c6e7bf332bf570e
  require caller == 0xa0acc61547f6bd066f7c9663c17a312b6ad7e187

def unknown84800812() payable:
  require calldata.size - 4 >= 128
  require cd[100] <= 4294967296
  require cd[100] + 36 <= calldata.size
  require ('cd', 100).length <= 4294967296 and cd[100] + ('cd', 100).length + 36 <= calldata.size
  require ext_code.size(caller)
  static call caller.0xdfe1681 with:
          gas gas_remaining wei
  if not ext_call.success:
      revert with ext_call.return_data[0 len return_data.size]
  require return_data.size >= 32
  require ('cd', 100).length >= 32
  stor1.length++
  if cd[36] > 0:
      stor1[stor1.length] = cd[36]
  else:
      stor1[stor1.length] = cd[68]
  if ('cd', 100)[0] + 1 != 7:
      require ('cd', 100)[0] + 1 < 7
      require ext_code.size(stor10[('cd', 100)[0]])
      static call stor10[('cd', 100)[0]].0xdfe1681 with:
              gas gas_remaining wei
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32
      require ext_code.size(stor10[('cd', 100)[0]])
      if ext_call.return_data[12 len 20] == 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c:
          static call stor10[('cd', 100)[0]].getReserves() with:
                  gas gas_remaining wei
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 96
          require ext_code.size(stor10[('cd', 100)[0]])
          call stor10[('cd', 100)[0]].0x22c0d9f with:
               gas gas_remaining wei
              args Mask(112, 0, ext_call.return_data[0]) - 1, 0, addr(this.address), 128, 32, ('cd', 100)[0] + 1
      else:
          static call stor10[('cd', 100)[0]].token1() with:
                  gas gas_remaining wei
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          require ext_call.return_data[12 len 20] == 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c
          require ext_code.size(stor10[('cd', 100)[0]])
          static call stor10[('cd', 100)[0]].getReserves() with:
                  gas gas_remaining wei
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 96
          require ext_code.size(stor10[('cd', 100)[0]])
          call stor10[('cd', 100)[0]].0x22c0d9f with:
               gas gas_remaining wei
              args 0, Mask(112, 0, ext_call.return_data[32]) - 1, addr(this.address), 128, 32, ('cd', 100)[0] + 1
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
  else:
      require ext_code.size(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c)
      static call 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.balanceOf(address owner) with:
              gas gas_remaining wei
             args this.address
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32
      require ext_code.size(0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae)
      static call 0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae.0xdfe1681 with:
              gas gas_remaining wei
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32
      require ext_code.size(0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae)
      static call 0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae.getReserves() with:
              gas gas_remaining wei
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 96
      require ext_code.size(0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae)
      if addr(ext_call.return_data[0]) == 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c:
          static call 0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae.token1() with:
                  gas gas_remaining wei
      else:
          static call 0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae.0xdfe1681 with:
                  gas gas_remaining wei
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32
      require 10^12 * ext_call.return_data[0] / 300 / 10^12 == ext_call.return_data[0] / 300
      if addr(ext_call.return_data[0]) == 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c:
          require Mask(112, 0, ext_call.return_data[0]) > 0
          require Mask(112, 0, ext_call.return_data[0])
          if not Mask(112, 0, ext_call.return_data[32]):
              require ext_code.size(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c)
              call 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.transfer(address to, uint256 value) with:
                   gas gas_remaining wei
                  args 0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae, ext_call.return_data[0] / 300
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >= 32
              require ext_code.size(0xcea0832e9cdbb5d476040d58ea07ecfbebb7672)
              call 0x0cea0832e9cdbb5d476040d58ea07ecfbebb7672.0x63ad2c41 with:
                   gas gas_remaining wei
                  args 0, ext_call.return_data[32 len 64], 0, 128, 0, mem[260]
          else:
              require Mask(112, 0, ext_call.return_data[32])
              require 10^12 * ext_call.return_data[0] / 300 / Mask(112, 0, ext_call.return_data[0]) * Mask(112, 0, ext_call.return_data[32]) / Mask(112, 0, ext_call.return_data[32]) == 10^12 * ext_call.return_data[0] / 300 / Mask(112, 0, ext_call.return_data[0])
              require ext_code.size(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c)
              call 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.transfer(address to, uint256 value) with:
                   gas gas_remaining wei
                  args 0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae, ext_call.return_data[0] / 300
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >= 32
              require ext_code.size(0xcea0832e9cdbb5d476040d58ea07ecfbebb7672)
              call 0x0cea0832e9cdbb5d476040d58ea07ecfbebb7672.0x63ad2c41 with:
                   gas gas_remaining wei
                  args 0, ext_call.return_data[32 len 64], uint32(10^12 * ext_call.return_data[0] / 300 / Mask(112, 0, ext_call.return_data[0]) * Mask(112, 0, ext_call.return_data[32]) / 10^12), 128, 0, mem[260]
      else:
          require Mask(112, 0, ext_call.return_data[32]) > 0
          require Mask(112, 0, ext_call.return_data[32])
          if not Mask(112, 0, ext_call.return_data[0]):
              require ext_code.size(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c)
              call 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.transfer(address to, uint256 value) with:
                   gas gas_remaining wei
                  args 0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae, ext_call.return_data[0] / 300
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >= 32
              require ext_code.size(0xcea0832e9cdbb5d476040d58ea07ecfbebb7672)
              call 0x0cea0832e9cdbb5d476040d58ea07ecfbebb7672.0x63ad2c41 with:
                   gas gas_remaining wei
                  args 0, ext_call.return_data[32 len 64], 0, 128, 0, mem[260]
          else:
              require Mask(112, 0, ext_call.return_data[0])
              require 10^12 * ext_call.return_data[0] / 300 / Mask(112, 0, ext_call.return_data[32]) * Mask(112, 0, ext_call.return_data[0]) / Mask(112, 0, ext_call.return_data[0]) == 10^12 * ext_call.return_data[0] / 300 / Mask(112, 0, ext_call.return_data[32])
              require ext_code.size(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c)
              call 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.transfer(address to, uint256 value) with:
                   gas gas_remaining wei
                  args 0x16b9a82891338f9ba80e2d6970fdda79d1eb0dae, ext_call.return_data[0] / 300
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >= 32
              require ext_code.size(0xcea0832e9cdbb5d476040d58ea07ecfbebb7672)
              call 0x0cea0832e9cdbb5d476040d58ea07ecfbebb7672.0x63ad2c41 with:
                   gas gas_remaining wei
                  args 0, ext_call.return_data[32 len 64], uint32(10^12 * ext_call.return_data[0] / 300 / Mask(112, 0, ext_call.return_data[32]) * Mask(112, 0, ext_call.return_data[0]) / 10^12), 128, 0, mem[260]
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      idx = stor1.length
      while idx > 0:
          require idx - 1 < 7
          require ext_code.size(stor8[idx])
          static call stor8[idx].factory() with:
                  gas gas_remaining wei
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          require idx - 1 < stor1.length
          mem[0] = 1
          mem[100] = stor8[idx]
          if addr(ext_call.return_data[0]) == 0xca143ce32fe78f1f7019d7d551a6402fc5350c73:
              mem[132] = 10000 * stor1[idx] / 9974
              require ext_code.size(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c)
              call 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.transfer(address to, uint256 value) with:
                   gas gas_remaining wei
                  args stor8[idx], 10000 * stor1[idx] / 9974
          else:
              mem[132] = 10000 * stor1[idx] / 9979
              require ext_code.size(0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c)
              call 0xbb4cdb9cbd36b01bd1cbaebf2de08d9173bc095c.transfer(address to, uint256 value) with:
                   gas gas_remaining wei
                  args stor8[idx], 10000 * stor1[idx] / 9979
          mem[96] = ext_call.return_data[0]
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          idx = idx - 1
          continue
import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'checkBalance' : () => Promise<bigint>,
  'deposit' : (arg_0: bigint) => Promise<undefined>,
  'withdraw' : (arg_0: bigint) => Promise<undefined>,
}

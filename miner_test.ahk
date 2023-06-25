#include i_miner.ahk

miner := new RolanciaMiner(["muro", "delin"])

miner.move()
miner.mine()

miner := new EpiloriaMiner(["muro", "delin", "ampi", "galid"])

miner.move()
miner.mine()


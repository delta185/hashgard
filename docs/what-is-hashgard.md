# What is Hashgard?

`hashgard` is the name of the Hashgard SDK application for the Hashgard Hub. It comes with 2 main entrypoints:

- `hashgardd`: The Hashgard Daemon, runs a full-node of the `hashgard` application.
- `hashgardcli`: The Hashgard command-line interface, which enables interaction with a Hashgard full-node.

`hashgard` is built on the Hashgard SDK using the following modules:

- `x/auth`: Accounts and signatures.
- `x/bank`: Token transfers.
- `x/staking`: Staking logic.
- `x/mint`: Inflation logic.
- `x/distribution`: Fee distribution logic.
- `x/slashing`: Slashing logic.
- `x/gov`: Governance logic.
- `x/ibc`: Inter-blockchain transfers.
- `x/params`: Handles app-level parameters.

>About the Hashgard Hub: The Hashgard Hub is the first Hub to be launched in the Hashgard Network. The role of a Hub is to facilitate transfers between blockchains. If a blockchain connects to a Hub via IBC, it automatically gains access to all the other blockchains that are connected to it. The Hashgard Hub is a public Proof-of-Stake chain. Its staking token is called the Gard.

Next, learn how to [install Hashgard](./installation.md).

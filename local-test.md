# How To Test Using Dapptools Locally

# Overview

When testing [vulcanize-geth](https://github.com/vulcanize/go-ethereum), there might be the need to use [dapptools](https://github.com/vulcanize/dapptools). Dapptools provides the following functionality:

- Creates a private network that can be easier to test than the mainnet.
- Allows you to make changes to the private network for testing purposes.

# Set-Up Steps

The following steps highlight how you can test geth locally using dapptools.

1.  Make sure you’ve cloned both [vulcanize-geth](https://github.com/vulcanize/go-ethereum) and [dapptools](https://github.com/vulcanize/dapptools).

2.  Go to the dapptools repository

3.  Update the following file `setup_local_test.sh`

    1.  Update `local_path_to_geth` to match the relative path to the local [vulcanize-geth](https://github.com/vulcanize/go-ethereum) repository: `local_path_to_geth="../go-ethereum-cerc/"`

4.  Update the following file to use the a local version of geth: `src/go-ethereum-statediff/default.nix`

    ```nix
    #src = fetchurl {
      #  url = "<https://github.com/vulcanize/go-ethereum/releases/download/${version}/geth-linux-amd64>";
      #  sha256 = "0s1brrr7c36y0pap1f4vll07n2lvjc90yxa6rhx5g6jpsivmfci5";
      #};
    src = ../../geth-linux-amd64;

    ```

5.  Update Docker resource allocations (Optional).

    1.  Increase memory allocation to 4GB and storage to 100GB
    2.  This might be necessary depending on system settings.

6.  Go back to the dapptools repository, and run: `./setup_local_test.sh`

    1.  This will do the following:
        1.  Build the geth binary
        2.  Move it to the local repository
        3.  Build a local container of the `ipld-eth-db`
        4.  Build a local container of `dapptools`.

7.  If you make a change to your geth code base, you will have to run `./setup_local_test.sh` (Optional)

8.  If you simply want to re-build the docker images, you can run: `docker-compose up --build -f docker-compose.localsetup.yml`

    1.  If you don’t want to rebuild the container: `docker-compose up -f docker-compose.localsetup.yml`
        1.  If you make any changes to the geth node and don't include the `--build` flag, the new geth binary will not be included in your container!

# Useful Information

## Using The Geth Console

To use the geth console do the following:

1.  Access the container’s command line
2.  cd `/tmp/tmp.yYWwRfjlka/8545` - The `tmp` directory will vary.
3.  `geth attach --datadir .`

## Adding New Parameters to Start Geth

1.  The following [PR](https://github.com/vulcanize/dapptools/commit/bdfd6253ea3b310471ab4b95724cbf70a35e56e6) captures all the places where changes need to be made.
2.  Add any necessary values to the `docker-compose.localsetup.yml` file.

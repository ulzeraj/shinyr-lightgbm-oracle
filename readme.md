# Shiny Server with LightGBM and ROracle

Putting this all together so you don't have to. Of course you will have to compile everything so maybe adding "ENV makeopts -jX" where X is the number of CPU threads on the Dockerfile before the R installs.

If you just feel like using an already compiled version made by a total stranger for testing purpose you may run something like this:

```
docker run -p 3838:3838 -v ./project:/srv/shiny-server/ gcr.io/monitoria-psantos-eti-br/shinyr-lightgbm-oracle:latest
```
# What is DevOps
## Why DevOps - Benefits
### Role of DevOps

Before DevOps:

- There was a blame culture between the teams
- Not smooth communications


After DevOps:

- Gap is bridged with a new team,
- Getting rid of the blame culture, by checking things
- Be able to understand the product built by other people, No need to understand how to build a product from scratch
- The environment should work for everyone


Benefits:

- Ease of use, making an easy environment for everyone
- Flexible, can work on different things and understand most areas
- Robustness, fast delivery
- Cost effective, can understand both departments


# How to initialise vagrant

- Create a directory
- Create a .gitignore (put .vagrant/ and .log files as ignored)
- Create a README.md
- vagrant init *NAME OF OS*
- rm -rf Vagrantfile, and nano a new Vagrantfile with:  
Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/xenial64"

end
- add, commit and push
- vagrant up to get it running
- vagrant ssh to access shell
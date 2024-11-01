# How to configure the minimum requirements of the raspbery pi


## Through the master
ssh to the master pi

`ssh master@pimaster`

And run the command 

`./slaves "<command to execute in all slaves>"`

Example

`./slaves "curl -L https://raw.githubusercontent.com/bobst-hack-n-pack/pis-configuration/refs/heads/main/requirements.sh | bash"`


## Individually per raspberry pi
ssh to the raspberry pi by doing as following

`ssh bobst@pi<pi number>`

Example

`ssh bobst@pi1`

Then run the following command

`curl -L https://raw.githubusercontent.com/bobst-hack-n-pack/pis-configuration/refs/heads/main/requirements.sh | bash`

import {createWalletClient,custom} from "https://esm.sh/viem"
const connectButton=document.getElementById("connectButton")
const fundButton=document.getElementById("fundButton")
const ethAmount=document.getElementById("ethAmount")
connectButton.onclick=connect
fundButton.onclick=fund

let walletClient

async function connect(){
    if (typeof window.ethereum!="undefined"){
        walletClient= createWalletClient({
            transport: custom(window.ethereum)})
        await walletClient.requestAddresses()
        connectButton.innerHTML="Connected!"
    }else{
        connectButton.innerHTML="Install Metamask"
    }
}

async function fund(){
    let ethValue=ethAmount.value 
    console.log(`Eth Amount: ${ethValue}`)
}
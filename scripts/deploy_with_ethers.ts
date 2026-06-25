import { deploy } from './ethers-lib'

(async () => {
  try {
    const result = await deploy('StudentGrades', [])
    console.log(`address: ${result.address}`)
    const result2 = await deploy('StoreInventory', [])
    console.log(`address: ${result2.address}`)
  } catch (e) {
    console.log(e.message)
  }
})()

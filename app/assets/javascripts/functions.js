//#Object.prototype.eq = (index)->
//#  temp_index = 0
//#  for k in this
//#    temp_index++
//#    if temp_index == index
//#      return this[k]
//#  return undefined
//
//window.eq = (obj, index)->
//  temp_index = 0
//  console.log("obj", obj)
//  for k in obj
//    console.log("k:", k)
//    if temp_index == index
//      return obj[k]
//    temp_index++
//  return null

window.eq = function(obj, index){
    temp_index = 0
    for(k in obj){
        if(temp_index == index){
            return obj[k]
        }
        temp_index++
    }

    return null
}

hash_length = function(obj){
    var length = 0
    for(k in obj){
        length++
    }

    return length
}
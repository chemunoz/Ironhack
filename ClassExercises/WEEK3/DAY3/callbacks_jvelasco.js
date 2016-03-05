function readFromFile (path, callback) {
  console.log('Reading from file path' + path)
  setTimeout(function () {
    callback('Simulated result')
  }, 2000)
}

function readAndWait (path, seconds, callback) {
  console.log('Gonna read from ' + path)
  console.log('and wait ' + seconds + 's')
  readFromFile(path, function (result) {
    setTimeout(function () {
      callback(result)
    }, seconds * 1000)
  })
}

readAndWait('./mitexto.txt', 4, function (result) {
  console.log('Result: ' + result)
})

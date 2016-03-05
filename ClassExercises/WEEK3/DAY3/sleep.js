//sleep(10,fn)

function sleep (time, fn)
{
  setTimeout(fn, time * 1000)
}

function after ()
{
  console.log('after')
}

console.log ('Started!!')
sleep(5, after)

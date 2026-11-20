import fire

def hello(name="World"):
  return "Hello my friend %s!" % name

if __name__ == '__main__':
  fire.Fire(hello)
import fire

def hello(name="World"):
  return "Hello friend %s!" % name

if __name__ == '__main__':
  fire.Fire(hello)
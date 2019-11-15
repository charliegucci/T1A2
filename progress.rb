require 'tty-progressbar'

bar = TTY::ProgressBar.new "Logging in to CoderAcademy... [:bar] :rate/s :mean_rate/s" do |conf|
    conf.total = 100
    conf.interval = 1
  end
  35.times do
    sleep(0.5)
    bar.advance(Random.rand(10))
  end
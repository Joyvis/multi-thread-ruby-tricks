require 'colorize'
require 'benchmark'

@mutex = Mutex.new

File.write('database.txt', '0')

def read_bank_account
  File.open('database.txt').read.to_i
end

def write_bank_account(value)
  File.open('database.txt', 'w+') do |f|
    f.write("#{value}")
  end
end

Benchmark.bm do |rep|
  rep.report('THREADS: ') do
    10.times.map do
      # it runs like in the begging - line by line
      Thread.new do
        # do anything
        # do anything
        # do anything
        sleep(1)
        @mutex.synchronize do
          value = read_bank_account.to_i
          value += 1
          write_bank_account(value)
        end
        # do anything
        # do anything
      end
    end.each(&:join)

    result = "Balance: #{read_bank_account}"

    if read_bank_account.to_i == 10
      puts result.green
    else
      puts result.red
    end
  end
end

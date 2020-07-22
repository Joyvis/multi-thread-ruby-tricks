require 'colorize'
require 'benchmark'

# run many times
File.write('database.txt', '0')

def read_bank_account
  File.open('database.txt').read.to_i
end

def write_bank_account(value)
  File.write('database.txt', value)
end

Benchmark.bm do |rep|
  rep.report('NO THREADS: ') do
    10.times.map do
      sleep(1)
      value = read_bank_account
      value += 1
      write_bank_account(value)
    end

    result = "Balance: #{read_bank_account}"

    if read_bank_account == 10
      puts result.green
    else
      puts result.red
    end
  end
end


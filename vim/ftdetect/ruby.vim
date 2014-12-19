autocmd BufNewFile,BufRead {c,C}apfile setfiletype ruby
autocmd BufNewFile,BufRead Gemfile setfiletype ruby
autocmd BufNewFile,BufRead Guardfile setfiletype ruby
autocmd BufNewFile,BufRead Berksfile setfiletype ruby
autocmd BufNewFile,BufRead Thorfile setfiletype ruby
autocmd BufNewFile,BufRead Vagrantfile setfiletype ruby

autocmd BufNewFile,BufRead *_spec.rb set filetype=ruby.rspec

#
# Cookbook:: sample
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

bash 'oomscoreadj' do
  user 'root'
  code <<-EOH
    for pid in $(pidof haproxy); do echo -500 > /proc/$pid/oom_score_adj; done
    EOH
end

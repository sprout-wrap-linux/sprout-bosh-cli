include_recipe 'sprout-base::bin_dir'

bosh = ::File.join(ENV['HOME'], node['bin_dir'], 'bosh')

remote_file bosh do
  source node['sprout']['bosh-cli']['url']
  mode   '0755'
  not_if { ::File.exist?(bosh) && `#{bosh} -version`.strip.split[1].split('-').first == node['sprout']['bosh']['version'] }
end

module VagrantPlugins
  module GuestFreeBSD
    module Cap
      class MountNFSFolder
        def self.mount_nfs_folder(machine, ip, folders)
          folders.each do |name, opts|
            machine.communicate.sudo("mkdir -p #{opts[:guestpath]}")
            machine.communicate.sudo("mount -t nfs '#{ip}:#{opts[:hostpath]}' '#{opts[:guestpath]}'")
          end
        end
      end
    end
  end
end

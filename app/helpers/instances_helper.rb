module InstancesHelper

  def retrieve_instances
    instances = Hash.new
    ec2instances = AWS.ec2.instances.inject({}) { |m, i| m[i.id] = i; m }

    # ec2instance = [ "instance_id", <AWS::EC2::Instance> ]
    ec2instances.each do |ec2instance|
      instances.merge!({
        name: ec2instance.last.tags["Name"],
        instance_id: ec2instance.first,
        instance_type: ec2instance.last.instance_type,
        availability_zone: ec2instance.last.availability_zone,
        status: ec2instance.last.status,
        public_dns_name: ec2instance.last.public_dns_name,
        public_ip: ec2instance.last.ip_address,
        launch_time: ec2instance.last.launch_time
      })
    end

    instances
  end

end

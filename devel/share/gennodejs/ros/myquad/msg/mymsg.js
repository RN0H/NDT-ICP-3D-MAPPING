// Auto-generated. Do not edit!

// (in-package myquad.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class mymsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.x = null;
      this.y = null;
      this.z = null;
      this.roll = null;
      this.yaw = null;
      this.pitch = null;
      this.q0 = null;
      this.q1 = null;
      this.q2 = null;
      this.q3 = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = 0.0;
      }
      if (initObj.hasOwnProperty('roll')) {
        this.roll = initObj.roll
      }
      else {
        this.roll = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('q0')) {
        this.q0 = initObj.q0
      }
      else {
        this.q0 = 0.0;
      }
      if (initObj.hasOwnProperty('q1')) {
        this.q1 = initObj.q1
      }
      else {
        this.q1 = 0.0;
      }
      if (initObj.hasOwnProperty('q2')) {
        this.q2 = initObj.q2
      }
      else {
        this.q2 = 0.0;
      }
      if (initObj.hasOwnProperty('q3')) {
        this.q3 = initObj.q3
      }
      else {
        this.q3 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mymsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.float32(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float32(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.float32(obj.z, buffer, bufferOffset);
    // Serialize message field [roll]
    bufferOffset = _serializer.float32(obj.roll, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float32(obj.yaw, buffer, bufferOffset);
    // Serialize message field [pitch]
    bufferOffset = _serializer.float32(obj.pitch, buffer, bufferOffset);
    // Serialize message field [q0]
    bufferOffset = _serializer.float32(obj.q0, buffer, bufferOffset);
    // Serialize message field [q1]
    bufferOffset = _serializer.float32(obj.q1, buffer, bufferOffset);
    // Serialize message field [q2]
    bufferOffset = _serializer.float32(obj.q2, buffer, bufferOffset);
    // Serialize message field [q3]
    bufferOffset = _serializer.float32(obj.q3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mymsg
    let len;
    let data = new mymsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [roll]
    data.roll = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [q0]
    data.q0 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [q1]
    data.q1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [q2]
    data.q2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [q3]
    data.q3 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'myquad/mymsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '28d802b043573036b2806f18ff6a49a4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #class $(file_name):
    #          type file_name.attr1 = var_name1
    #		   type file_name.attr2 = var_name2
    
    
    #rosmsg show     $(PACKAGE)/$(FILE.msg)				##For Reading
    #rosmsg show -r  $(PACKAGE)/$(FILE.msg)				##For Reading Raw
    #echo "field type variable" > msg/$(FILE.msg)       ##For Writing 
    
    #AFTER EDITING, cd ~/catkin_ws; catkin_make #compile msg
    #FIELD_TYPE VARIABLE Format
    
    Header header		#seq, time_stamp, id
    float32 x
    float32 y
    float32 z
    
    float32 roll
    float32 yaw
    float32 pitch
    
    float32 q0
    float32 q1
    float32 q2
    float32 q3
    
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mymsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = 0.0
    }

    if (msg.roll !== undefined) {
      resolved.roll = msg.roll;
    }
    else {
      resolved.roll = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.q0 !== undefined) {
      resolved.q0 = msg.q0;
    }
    else {
      resolved.q0 = 0.0
    }

    if (msg.q1 !== undefined) {
      resolved.q1 = msg.q1;
    }
    else {
      resolved.q1 = 0.0
    }

    if (msg.q2 !== undefined) {
      resolved.q2 = msg.q2;
    }
    else {
      resolved.q2 = 0.0
    }

    if (msg.q3 !== undefined) {
      resolved.q3 = msg.q3;
    }
    else {
      resolved.q3 = 0.0
    }

    return resolved;
    }
};

module.exports = mymsg;

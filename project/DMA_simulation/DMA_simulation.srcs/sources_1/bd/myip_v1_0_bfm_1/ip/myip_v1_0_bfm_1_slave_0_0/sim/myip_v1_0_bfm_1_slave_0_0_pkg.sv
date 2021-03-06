///////////////////////////////////////////////////////////////////////////
//NOTE: This file has been automatically generated by Vivado.
///////////////////////////////////////////////////////////////////////////
`timescale 1ps/1ps
package myip_v1_0_bfm_1_slave_0_0_pkg;
import axi_vip_pkg::*;
///////////////////////////////////////////////////////////////////////////
// These parameters are named after the component for use in your verification 
// environment.
///////////////////////////////////////////////////////////////////////////
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_PROTOCOL           = 0;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_READ_WRITE_MODE    = "READ_WRITE";
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_INTERFACE_MODE     = 2;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_ADDR_WIDTH         = 32;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_DATA_WIDTH         = 32;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_ID_WIDTH           = 2;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_AWUSER_WIDTH       = 1;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_ARUSER_WIDTH       = 1;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_RUSER_WIDTH        = 1;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_WUSER_WIDTH        = 1;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_BUSER_WIDTH        = 1;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_SUPPORTS_NARROW    = 0;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_HAS_BURST          = 1;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_HAS_LOCK           = 1;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_HAS_CACHE          = 1;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_HAS_REGION         = 0;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_HAS_QOS            = 1;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_HAS_PROT           = 1;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_HAS_WSTRB          = 1;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_HAS_BRESP          = 1;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_HAS_RRESP          = 1;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_HAS_ACLKEN         = 0;
      parameter myip_v1_0_bfm_1_slave_0_0_VIP_HAS_ARESETN        = 1;
///////////////////////////////////////////////////////////////////////////


typedef axi_slv_agent #(myip_v1_0_bfm_1_slave_0_0_VIP_PROTOCOL, 
                        myip_v1_0_bfm_1_slave_0_0_VIP_ADDR_WIDTH,
                        myip_v1_0_bfm_1_slave_0_0_VIP_DATA_WIDTH,
                        myip_v1_0_bfm_1_slave_0_0_VIP_DATA_WIDTH,
                        myip_v1_0_bfm_1_slave_0_0_VIP_ID_WIDTH,
                        myip_v1_0_bfm_1_slave_0_0_VIP_ID_WIDTH,
                        myip_v1_0_bfm_1_slave_0_0_VIP_AWUSER_WIDTH, 
                        myip_v1_0_bfm_1_slave_0_0_VIP_WUSER_WIDTH, 
                        myip_v1_0_bfm_1_slave_0_0_VIP_BUSER_WIDTH, 
                        myip_v1_0_bfm_1_slave_0_0_VIP_ARUSER_WIDTH,
                        myip_v1_0_bfm_1_slave_0_0_VIP_RUSER_WIDTH, 
                        myip_v1_0_bfm_1_slave_0_0_VIP_SUPPORTS_NARROW, 
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_BURST,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_LOCK,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_CACHE,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_REGION,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_PROT,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_QOS,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_WSTRB,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_BRESP,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_RRESP,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_ARESETN) myip_v1_0_bfm_1_slave_0_0_slv_t;

typedef axi_slv_mem_agent #(myip_v1_0_bfm_1_slave_0_0_VIP_PROTOCOL, 
                        myip_v1_0_bfm_1_slave_0_0_VIP_ADDR_WIDTH,
                        myip_v1_0_bfm_1_slave_0_0_VIP_DATA_WIDTH,
                        myip_v1_0_bfm_1_slave_0_0_VIP_DATA_WIDTH,
                        myip_v1_0_bfm_1_slave_0_0_VIP_ID_WIDTH,
                        myip_v1_0_bfm_1_slave_0_0_VIP_ID_WIDTH,
                        myip_v1_0_bfm_1_slave_0_0_VIP_AWUSER_WIDTH, 
                        myip_v1_0_bfm_1_slave_0_0_VIP_WUSER_WIDTH, 
                        myip_v1_0_bfm_1_slave_0_0_VIP_BUSER_WIDTH, 
                        myip_v1_0_bfm_1_slave_0_0_VIP_ARUSER_WIDTH,
                        myip_v1_0_bfm_1_slave_0_0_VIP_RUSER_WIDTH, 
                        myip_v1_0_bfm_1_slave_0_0_VIP_SUPPORTS_NARROW, 
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_BURST,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_LOCK,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_CACHE,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_REGION,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_PROT,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_QOS,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_WSTRB,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_BRESP,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_RRESP,
                        myip_v1_0_bfm_1_slave_0_0_VIP_HAS_ARESETN) myip_v1_0_bfm_1_slave_0_0_slv_mem_t;
                        
      
///////////////////////////////////////////////////////////////////////////
// How to start the verification component
///////////////////////////////////////////////////////////////////////////
//      myip_v1_0_bfm_1_slave_0_0_slv_t  myip_v1_0_bfm_1_slave_0_0_slv;
//      initial begin : START_myip_v1_0_bfm_1_slave_0_0_SLAVE
//        myip_v1_0_bfm_1_slave_0_0_slv = new("myip_v1_0_bfm_1_slave_0_0_slv", `myip_v1_0_bfm_1_slave_0_0_PATH_TO_INTERFACE);
//        myip_v1_0_bfm_1_slave_0_0_slv.start_slave();
//      end

endpackage : myip_v1_0_bfm_1_slave_0_0_pkg

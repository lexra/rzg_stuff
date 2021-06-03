#ifndef SYSC_IOBITMASK_H
#define SYSC_IOBITMASK_H

#define R_SYSC_SYS_RAM0_ECC_VECCEN_Msk                                         (0x00000001UL)
#define R_SYSC_SYS_RAM0_ECC_VECCEN_Pos                                         (0UL)
#define R_SYSC_SYS_RAM0_EN_VCEN_Msk                                            (0x00000001UL)
#define R_SYSC_SYS_RAM0_EN_VCEN_Pos                                            (0UL)
#define R_SYSC_SYS_RAM0_EN_VLWEN_Msk                                           (0x00000002UL)
#define R_SYSC_SYS_RAM0_EN_VLWEN_Pos                                           (1UL)
#define R_SYSC_SYS_RAM1_ECC_VECCEN_Msk                                         (0x00000001UL)
#define R_SYSC_SYS_RAM1_ECC_VECCEN_Pos                                         (0UL)
#define R_SYSC_SYS_RAM1_EN_VCEN_Msk                                            (0x00000001UL)
#define R_SYSC_SYS_RAM1_EN_VCEN_Pos                                            (0UL)
#define R_SYSC_SYS_RAM1_EN_VLWEN_Msk                                           (0x00000002UL)
#define R_SYSC_SYS_RAM1_EN_VLWEN_Pos                                           (1UL)
#define R_SYSC_SYS_WDT0_CTRL_WDTSTOP_Msk                                       (0x00000001UL)
#define R_SYSC_SYS_WDT0_CTRL_WDTSTOP_Pos                                       (0UL)
#define R_SYSC_SYS_WDT1_CTRL_WDTSTOP_Msk                                       (0x00000001UL)
#define R_SYSC_SYS_WDT1_CTRL_WDTSTOP_Pos                                       (0UL)
#define R_SYSC_SYS_WDT2_CTRL_WDTSTOP_Msk                                       (0x00000001UL)
#define R_SYSC_SYS_WDT2_CTRL_WDTSTOP_Pos                                       (0UL)
#define R_SYSC_SYS_GETH0_CFG_FEC_GIGA_ENABLE_Msk                               (0x01000000UL)
#define R_SYSC_SYS_GETH0_CFG_FEC_GIGA_ENABLE_Pos                               (24UL)
#define R_SYSC_SYS_GETH1_CFG_FEC_GIGA_ENABLE_Msk                               (0x01000000UL)
#define R_SYSC_SYS_GETH1_CFG_FEC_GIGA_ENABLE_Pos                               (24UL)
#define R_SYSC_SYS_I2C0_CFG_af_bypass_Msk                                      (0x00000001UL)
#define R_SYSC_SYS_I2C0_CFG_af_bypass_Pos                                      (0UL)
#define R_SYSC_SYS_I2C1_CFG_af_bypass_Msk                                      (0x00000001UL)
#define R_SYSC_SYS_I2C1_CFG_af_bypass_Pos                                      (0UL)
#define R_SYSC_SYS_I2C2_CFG_af_bypass_Msk                                      (0x00000001UL)
#define R_SYSC_SYS_I2C2_CFG_af_bypass_Pos                                      (0UL)
#define R_SYSC_SYS_I2C3_CFG_af_bypass_Msk                                      (0x00000001UL)
#define R_SYSC_SYS_I2C3_CFG_af_bypass_Pos                                      (0UL)
#define R_SYSC_SYS_CM33_CFG0_CONFIGSSYSTICK_Msk                                (0x03FFFFFFUL)
#define R_SYSC_SYS_CM33_CFG0_CONFIGSSYSTICK_Pos                                (0UL)
#define R_SYSC_SYS_CM33_CFG1_CONFIGNSSYSTICK_Msk                               (0x03FFFFFFUL)
#define R_SYSC_SYS_CM33_CFG1_CONFIGNSSYSTICK_Pos                               (0UL)
#define R_SYSC_SYS_CM33_CFG2_INITSVTOR_Msk                                     (0xFFFFFF80UL)
#define R_SYSC_SYS_CM33_CFG2_INITSVTOR_Pos                                     (7UL)
#define R_SYSC_SYS_CM33_CFG3_INITNSVTOR_Msk                                    (0xFFFFFF80UL)
#define R_SYSC_SYS_CM33_CFG3_INITNSVTOR_Pos                                    (7UL)
#define R_SYSC_SYS_CM33_LOCK_LOCKSVTAIRCR_Msk                                  (0x00000001UL)
#define R_SYSC_SYS_CM33_LOCK_LOCKSVTAIRCR_Pos                                  (0UL)
#define R_SYSC_SYS_CM33_LOCK_LOCKNSVTOR_Msk                                    (0x00000002UL)
#define R_SYSC_SYS_CM33_LOCK_LOCKNSVTOR_Pos                                    (1UL)
#define R_SYSC_SYS_CA55_CFG_RVAL0_RVBARADDRL0_Msk                              (0xFFFFFFFCUL)
#define R_SYSC_SYS_CA55_CFG_RVAL0_RVBARADDRL0_Pos                              (2UL)
#define R_SYSC_SYS_CA55_CFG_RVAH0_RVBARADDRH0_Msk                              (0x000000FFUL)
#define R_SYSC_SYS_CA55_CFG_RVAH0_RVBARADDRH0_Pos                              (0UL)
#define R_SYSC_SYS_CA55_CFG_RVAL1_RVBARADDRL1_Msk                              (0xFFFFFFFCUL)
#define R_SYSC_SYS_CA55_CFG_RVAL1_RVBARADDRL1_Pos                              (2UL)
#define R_SYSC_SYS_CA55_CFG_RVAH1_RVBARADDRH1_Msk                              (0x000000FFUL)
#define R_SYSC_SYS_CA55_CFG_RVAH1_RVBARADDRH1_Pos                              (0UL)
#define R_SYSC_SYS_LSI_MODE_STAT_MD_BOOT_Msk                                   (0x00000007UL)
#define R_SYSC_SYS_LSI_MODE_STAT_MD_BOOT_Pos                                   (0UL)
#define R_SYSC_SYS_LSI_MODE_STAT_DEBUGEN_Msk                                   (0x00000200UL)
#define R_SYSC_SYS_LSI_MODE_STAT_DEBUGEN_Pos                                   (9UL)
#define R_SYSC_SYS_LSI_MODE_STAT_MD_CLKS_Msk                                   (0x00001000UL)
#define R_SYSC_SYS_LSI_MODE_STAT_MD_CLKS_Pos                                   (12UL)
#define R_SYSC_SYS_LSI_MODE_STAT_MD_OSCDRV_Msk                                 (0x0000C000UL)
#define R_SYSC_SYS_LSI_MODE_STAT_MD_OSCDRV_Pos                                 (14UL)
#define R_SYSC_SYS_AOF0_OFS00_SXSDHI_0_Msk                                     (0x0000000FUL)
#define R_SYSC_SYS_AOF0_OFS00_SXSDHI_0_Pos                                     (0UL)
#define R_SYSC_SYS_AOF0_OFS01_SXSDHI_0_Msk                                     (0x000000F0UL)
#define R_SYSC_SYS_AOF0_OFS01_SXSDHI_0_Pos                                     (4UL)
#define R_SYSC_SYS_AOF0_OFS10_SXSDHI_0_Msk                                     (0x00000F00UL)
#define R_SYSC_SYS_AOF0_OFS10_SXSDHI_0_Pos                                     (8UL)
#define R_SYSC_SYS_AOF0_OFS11_SXSDHI_0_Msk                                     (0x0000F000UL)
#define R_SYSC_SYS_AOF0_OFS11_SXSDHI_0_Pos                                     (12UL)
#define R_SYSC_SYS_AOF0_OFS00_SXSDHI_1_Msk                                     (0x000F0000UL)
#define R_SYSC_SYS_AOF0_OFS00_SXSDHI_1_Pos                                     (16UL)
#define R_SYSC_SYS_AOF0_OFS01_SXSDHI_1_Msk                                     (0x00F00000UL)
#define R_SYSC_SYS_AOF0_OFS01_SXSDHI_1_Pos                                     (20UL)
#define R_SYSC_SYS_AOF0_OFS10_SXSDHI_1_Msk                                     (0x0F000000UL)
#define R_SYSC_SYS_AOF0_OFS10_SXSDHI_1_Pos                                     (24UL)
#define R_SYSC_SYS_AOF0_OFS11_SXSDHI_1_Msk                                     (0xF0000000UL)
#define R_SYSC_SYS_AOF0_OFS11_SXSDHI_1_Pos                                     (28UL)
#define R_SYSC_SYS_AOF1_OFS00_SXGIGE_0_Msk                                     (0x0000000FUL)
#define R_SYSC_SYS_AOF1_OFS00_SXGIGE_0_Pos                                     (0UL)
#define R_SYSC_SYS_AOF1_OFS01_SXGIGE_0_Msk                                     (0x000000F0UL)
#define R_SYSC_SYS_AOF1_OFS01_SXGIGE_0_Pos                                     (4UL)
#define R_SYSC_SYS_AOF1_OFS10_SXGIGE_0_Msk                                     (0x00000F00UL)
#define R_SYSC_SYS_AOF1_OFS10_SXGIGE_0_Pos                                     (8UL)
#define R_SYSC_SYS_AOF1_OFS11_SXGIGE_0_Msk                                     (0x0000F000UL)
#define R_SYSC_SYS_AOF1_OFS11_SXGIGE_0_Pos                                     (12UL)
#define R_SYSC_SYS_AOF1_OFS00_SXGIGE_1_Msk                                     (0x000F0000UL)
#define R_SYSC_SYS_AOF1_OFS00_SXGIGE_1_Pos                                     (16UL)
#define R_SYSC_SYS_AOF1_OFS01_SXGIGE_1_Msk                                     (0x00F00000UL)
#define R_SYSC_SYS_AOF1_OFS01_SXGIGE_1_Pos                                     (20UL)
#define R_SYSC_SYS_AOF1_OFS10_SXGIGE_1_Msk                                     (0x0F000000UL)
#define R_SYSC_SYS_AOF1_OFS10_SXGIGE_1_Pos                                     (24UL)
#define R_SYSC_SYS_AOF1_OFS11_SXGIGE_1_Msk                                     (0xF0000000UL)
#define R_SYSC_SYS_AOF1_OFS11_SXGIGE_1_Pos                                     (28UL)
#define R_SYSC_SYS_AOF2_OFS00_SXUSB2_0_H_Msk                                   (0x0000000FUL)
#define R_SYSC_SYS_AOF2_OFS00_SXUSB2_0_H_Pos                                   (0UL)
#define R_SYSC_SYS_AOF2_OFS01_SXUSB2_0_H_Msk                                   (0x000000F0UL)
#define R_SYSC_SYS_AOF2_OFS01_SXUSB2_0_H_Pos                                   (4UL)
#define R_SYSC_SYS_AOF2_OFS10_SXUSB2_0_H_Msk                                   (0x00000F00UL)
#define R_SYSC_SYS_AOF2_OFS10_SXUSB2_0_H_Pos                                   (8UL)
#define R_SYSC_SYS_AOF2_OFS11_SXUSB2_0_H_Msk                                   (0x0000F000UL)
#define R_SYSC_SYS_AOF2_OFS11_SXUSB2_0_H_Pos                                   (12UL)
#define R_SYSC_SYS_AOF2_OFS00_SXUSB2_1_Msk                                     (0x000F0000UL)
#define R_SYSC_SYS_AOF2_OFS00_SXUSB2_1_Pos                                     (16UL)
#define R_SYSC_SYS_AOF2_OFS01_SXUSB2_1_Msk                                     (0x00F00000UL)
#define R_SYSC_SYS_AOF2_OFS01_SXUSB2_1_Pos                                     (20UL)
#define R_SYSC_SYS_AOF2_OFS10_SXUSB2_1_Msk                                     (0x0F000000UL)
#define R_SYSC_SYS_AOF2_OFS10_SXUSB2_1_Pos                                     (24UL)
#define R_SYSC_SYS_AOF2_OFS11_SXUSB2_1_Msk                                     (0xF0000000UL)
#define R_SYSC_SYS_AOF2_OFS11_SXUSB2_1_Pos                                     (28UL)
#define R_SYSC_SYS_AOF3_OFS00_SXUSB2_0_F_Msk                                   (0x0000000FUL)
#define R_SYSC_SYS_AOF3_OFS00_SXUSB2_0_F_Pos                                   (0UL)
#define R_SYSC_SYS_AOF3_OFS01_SXUSB2_0_F_Msk                                   (0x000000F0UL)
#define R_SYSC_SYS_AOF3_OFS01_SXUSB2_0_F_Pos                                   (4UL)
#define R_SYSC_SYS_AOF3_OFS10_SXUSB2_0_F_Msk                                   (0x00000F00UL)
#define R_SYSC_SYS_AOF3_OFS10_SXUSB2_0_F_Pos                                   (8UL)
#define R_SYSC_SYS_AOF3_OFS11_SXUSB2_0_F_Msk                                   (0x0000F000UL)
#define R_SYSC_SYS_AOF3_OFS11_SXUSB2_0_F_Pos                                   (12UL)
#define R_SYSC_SYS_AOF4_OFS00_SXLCDC_Msk                                       (0x0000000FUL)
#define R_SYSC_SYS_AOF4_OFS00_SXLCDC_Pos                                       (0UL)
#define R_SYSC_SYS_AOF4_OFS01_SXLCDC_Msk                                       (0x000000F0UL)
#define R_SYSC_SYS_AOF4_OFS01_SXLCDC_Pos                                       (4UL)
#define R_SYSC_SYS_AOF4_OFS10_SXLCDC_Msk                                       (0x00000F00UL)
#define R_SYSC_SYS_AOF4_OFS10_SXLCDC_Pos                                       (8UL)
#define R_SYSC_SYS_AOF4_OFS11_SXLCDC_Msk                                       (0x0000F000UL)
#define R_SYSC_SYS_AOF4_OFS11_SXLCDC_Pos                                       (12UL)
#define R_SYSC_SYS_AOF4_OFS00_SXDSIL_Msk                                       (0x000F0000UL)
#define R_SYSC_SYS_AOF4_OFS00_SXDSIL_Pos                                       (16UL)
#define R_SYSC_SYS_AOF4_OFS01_SXDSIL_Msk                                       (0x00F00000UL)
#define R_SYSC_SYS_AOF4_OFS01_SXDSIL_Pos                                       (20UL)
#define R_SYSC_SYS_AOF4_OFS10_SXDSIL_Msk                                       (0x0F000000UL)
#define R_SYSC_SYS_AOF4_OFS10_SXDSIL_Pos                                       (24UL)
#define R_SYSC_SYS_AOF4_OFS11_SXDSIL_Msk                                       (0xF0000000UL)
#define R_SYSC_SYS_AOF4_OFS11_SXDSIL_Pos                                       (28UL)
#define R_SYSC_SYS_AOF5_OFS00_SXH264_Msk                                       (0x0000000FUL)
#define R_SYSC_SYS_AOF5_OFS00_SXH264_Pos                                       (0UL)
#define R_SYSC_SYS_AOF5_OFS01_SXH264_Msk                                       (0x000000F0UL)
#define R_SYSC_SYS_AOF5_OFS01_SXH264_Pos                                       (4UL)
#define R_SYSC_SYS_AOF5_OFS10_SXH264_Msk                                       (0x00000F00UL)
#define R_SYSC_SYS_AOF5_OFS10_SXH264_Pos                                       (8UL)
#define R_SYSC_SYS_AOF5_OFS11_SXH264_Msk                                       (0x0000F000UL)
#define R_SYSC_SYS_AOF5_OFS11_SXH264_Pos                                       (12UL)
#define R_SYSC_SYS_AOF6_OFS00_SXDMAC_S_Msk                                     (0x0000000FUL)
#define R_SYSC_SYS_AOF6_OFS00_SXDMAC_S_Pos                                     (0UL)
#define R_SYSC_SYS_AOF6_OFS01_SXDMAC_S_Msk                                     (0x000000F0UL)
#define R_SYSC_SYS_AOF6_OFS01_SXDMAC_S_Pos                                     (4UL)
#define R_SYSC_SYS_AOF6_OFS10_SXDMAC_S_Msk                                     (0x00000F00UL)
#define R_SYSC_SYS_AOF6_OFS10_SXDMAC_S_Pos                                     (8UL)
#define R_SYSC_SYS_AOF6_OFS11_SXDMAC_S_Msk                                     (0x0000F000UL)
#define R_SYSC_SYS_AOF6_OFS11_SXDMAC_S_Pos                                     (12UL)
#define R_SYSC_SYS_AOF6_OFS00_SXDMAC_NS_Msk                                    (0x000F0000UL)
#define R_SYSC_SYS_AOF6_OFS00_SXDMAC_NS_Pos                                    (16UL)
#define R_SYSC_SYS_AOF6_OFS01_SXDMAC_NS_Msk                                    (0x00F00000UL)
#define R_SYSC_SYS_AOF6_OFS01_SXDMAC_NS_Pos                                    (20UL)
#define R_SYSC_SYS_AOF6_OFS10_SXDMAC_NS_Msk                                    (0x0F000000UL)
#define R_SYSC_SYS_AOF6_OFS10_SXDMAC_NS_Pos                                    (24UL)
#define R_SYSC_SYS_AOF6_OFS11_SXDMAC_NS_Msk                                    (0xF0000000UL)
#define R_SYSC_SYS_AOF6_OFS11_SXDMAC_NS_Pos                                    (28UL)
#define R_SYSC_SYS_LP_CTL0_MAIN_CPU_Msk                                        (0x00000001UL)
#define R_SYSC_SYS_LP_CTL0_MAIN_CPU_Pos                                        (0UL)
#define R_SYSC_SYS_LP_CTL1_STBY_Msk                                            (0x00000001UL)
#define R_SYSC_SYS_LP_CTL1_STBY_Pos                                            (0UL)
#define R_SYSC_SYS_LP_CTL1_CA55SLEEP_REQ_Msk                                   (0x00000300UL)
#define R_SYSC_SYS_LP_CTL1_CA55SLEEP_REQ_Pos                                   (8UL)
#define R_SYSC_SYS_LP_CTL1_CM33SLEEP_REQ_Msk                                   (0x00001000UL)
#define R_SYSC_SYS_LP_CTL1_CM33SLEEP_REQ_Pos                                   (12UL)
#define R_SYSC_SYS_LP_CTL1_STBY_CA55ST_Msk                                     (0x00010000UL)
#define R_SYSC_SYS_LP_CTL1_STBY_CA55ST_Pos                                     (16UL)
#define R_SYSC_SYS_LP_CTL1_STBY_CM33ST_Msk                                     (0x00020000UL)
#define R_SYSC_SYS_LP_CTL1_STBY_CM33ST_Pos                                     (17UL)
#define R_SYSC_SYS_LP_CTL1_CA55SLEEP_ACK_Msk                                   (0x03000000UL)
#define R_SYSC_SYS_LP_CTL1_CA55SLEEP_ACK_Pos                                   (24UL)
#define R_SYSC_SYS_LP_CTL1_CM33SLEEP_ACK_Msk                                   (0x10000000UL)
#define R_SYSC_SYS_LP_CTL1_CM33SLEEP_ACK_Pos                                   (28UL)
#define R_SYSC_SYS_LP_CTL2_CA55_STBYCTL_Msk                                    (0x00000001UL)
#define R_SYSC_SYS_LP_CTL2_CA55_STBYCTL_Pos                                    (0UL)
#define R_SYSC_SYS_LP_CTL3_U0DP_F_Msk                                          (0x00000001UL)
#define R_SYSC_SYS_LP_CTL3_U0DP_F_Pos                                          (0UL)
#define R_SYSC_SYS_LP_CTL3_U0DM_F_Msk                                          (0x00000002UL)
#define R_SYSC_SYS_LP_CTL3_U0DM_F_Pos                                          (1UL)
#define R_SYSC_SYS_LP_CTL3_U0VBUSIN_F_Msk                                      (0x00000004UL)
#define R_SYSC_SYS_LP_CTL3_U0VBUSIN_F_Pos                                      (2UL)
#define R_SYSC_SYS_LP_CTL3_U0OVRCLR_F_Msk                                      (0x00000008UL)
#define R_SYSC_SYS_LP_CTL3_U0OVRCLR_F_Pos                                      (3UL)
#define R_SYSC_SYS_LP_CTL3_U1DP_F_Msk                                          (0x00000100UL)
#define R_SYSC_SYS_LP_CTL3_U1DP_F_Pos                                          (8UL)
#define R_SYSC_SYS_LP_CTL3_U1DM_F_Msk                                          (0x00000200UL)
#define R_SYSC_SYS_LP_CTL3_U1DM_F_Pos                                          (9UL)
#define R_SYSC_SYS_LP_CTL3_U1OVRCLR_F_Msk                                      (0x00000800UL)
#define R_SYSC_SYS_LP_CTL3_U1OVRCLR_F_Pos                                      (11UL)
#define R_SYSC_SYS_LP_CTL3_IRQ_F70_Msk                                         (0x00FF0000UL)
#define R_SYSC_SYS_LP_CTL3_IRQ_F70_Pos                                         (16UL)
#define R_SYSC_SYS_LP_CTL3_NMI_F_Msk                                           (0x01000000UL)
#define R_SYSC_SYS_LP_CTL3_NMI_F_Pos                                           (24UL)
#define R_SYSC_SYS_LP_CTL4_U0DP_E_Msk                                          (0x00000001UL)
#define R_SYSC_SYS_LP_CTL4_U0DP_E_Pos                                          (0UL)
#define R_SYSC_SYS_LP_CTL4_U0DM_E_Msk                                          (0x00000002UL)
#define R_SYSC_SYS_LP_CTL4_U0DM_E_Pos                                          (1UL)
#define R_SYSC_SYS_LP_CTL4_U0VBUSIN_E_Msk                                      (0x00000004UL)
#define R_SYSC_SYS_LP_CTL4_U0VBUSIN_E_Pos                                      (2UL)
#define R_SYSC_SYS_LP_CTL4_U0OVRCLR_E_Msk                                      (0x00000008UL)
#define R_SYSC_SYS_LP_CTL4_U0OVRCLR_E_Pos                                      (3UL)
#define R_SYSC_SYS_LP_CTL4_U1DP_E_Msk                                          (0x00000100UL)
#define R_SYSC_SYS_LP_CTL4_U1DP_E_Pos                                          (8UL)
#define R_SYSC_SYS_LP_CTL4_U1DM_E_Msk                                          (0x00000200UL)
#define R_SYSC_SYS_LP_CTL4_U1DM_E_Pos                                          (9UL)
#define R_SYSC_SYS_LP_CTL4_U1OVRCLR_E_Msk                                      (0x00000800UL)
#define R_SYSC_SYS_LP_CTL4_U1OVRCLR_E_Pos                                      (11UL)
#define R_SYSC_SYS_LP_CTL4_IRQ_E0_Msk                                          (0x00010000UL)
#define R_SYSC_SYS_LP_CTL4_IRQ_E0_Pos                                          (16UL)
#define R_SYSC_SYS_LP_CTL4_IRQ_E1_Msk                                          (0x00020000UL)
#define R_SYSC_SYS_LP_CTL4_IRQ_E1_Pos                                          (17UL)
#define R_SYSC_SYS_LP_CTL4_IRQ_E2_Msk                                          (0x00040000UL)
#define R_SYSC_SYS_LP_CTL4_IRQ_E2_Pos                                          (18UL)
#define R_SYSC_SYS_LP_CTL4_IRQ_E3_Msk                                          (0x00080000UL)
#define R_SYSC_SYS_LP_CTL4_IRQ_E3_Pos                                          (19UL)
#define R_SYSC_SYS_LP_CTL4_IRQ_E4_Msk                                          (0x00100000UL)
#define R_SYSC_SYS_LP_CTL4_IRQ_E4_Pos                                          (20UL)
#define R_SYSC_SYS_LP_CTL4_IRQ_E5_Msk                                          (0x00200000UL)
#define R_SYSC_SYS_LP_CTL4_IRQ_E5_Pos                                          (21UL)
#define R_SYSC_SYS_LP_CTL4_IRQ_E6_Msk                                          (0x00400000UL)
#define R_SYSC_SYS_LP_CTL4_IRQ_E6_Pos                                          (22UL)
#define R_SYSC_SYS_LP_CTL4_IRQ_E7_Msk                                          (0x00800000UL)
#define R_SYSC_SYS_LP_CTL4_IRQ_E7_Pos                                          (23UL)
#define R_SYSC_SYS_LP_CTL4_NMI_E_Msk                                           (0x01000000UL)
#define R_SYSC_SYS_LP_CTL4_NMI_E_Pos                                           (24UL)
#define R_SYSC_SYS_LP_CTL5_ASCLKQDENY_F_Msk                                    (0x00000002UL)
#define R_SYSC_SYS_LP_CTL5_ASCLKQDENY_F_Pos                                    (1UL)
#define R_SYSC_SYS_LP_CTL5_AMCLKQDENY_F_Msk                                    (0x00000004UL)
#define R_SYSC_SYS_LP_CTL5_AMCLKQDENY_F_Pos                                    (2UL)
#define R_SYSC_SYS_LP_CTL5_STBY_F_Msk                                          (0x00000010UL)
#define R_SYSC_SYS_LP_CTL5_STBY_F_Pos                                          (4UL)
#define R_SYSC_SYS_LP_CTL5_CA55SLEEP0_F_Msk                                    (0x00000100UL)
#define R_SYSC_SYS_LP_CTL5_CA55SLEEP0_F_Pos                                    (8UL)
#define R_SYSC_SYS_LP_CTL5_CA55SLEEP1_F_Msk                                    (0x00000200UL)
#define R_SYSC_SYS_LP_CTL5_CA55SLEEP1_F_Pos                                    (9UL)
#define R_SYSC_SYS_LP_CTL5_CM33SLEEP_F_Msk                                     (0x00000400UL)
#define R_SYSC_SYS_LP_CTL5_CM33SLEEP_F_Pos                                     (10UL)
#define R_SYSC_SYS_LP_CTL5_CA55STBYDONE_F_Msk                                  (0x00010000UL)
#define R_SYSC_SYS_LP_CTL5_CA55STBYDONE_F_Pos                                  (16UL)
#define R_SYSC_SYS_LP_CTL5_CM33STBYR_F_Msk                                     (0x00100000UL)
#define R_SYSC_SYS_LP_CTL5_CM33STBYR_F_Pos                                     (20UL)
#define R_SYSC_SYS_LP_CTL6_ASCLKQDENY_E_Msk                                    (0x00000002UL)
#define R_SYSC_SYS_LP_CTL6_ASCLKQDENY_E_Pos                                    (1UL)
#define R_SYSC_SYS_LP_CTL6_AMCLKQDENY_E_Msk                                    (0x00000004UL)
#define R_SYSC_SYS_LP_CTL6_AMCLKQDENY_E_Pos                                    (2UL)
#define R_SYSC_SYS_LP_CTL6_STBY_E_Msk                                          (0x00000010UL)
#define R_SYSC_SYS_LP_CTL6_STBY_E_Pos                                          (4UL)
#define R_SYSC_SYS_LP_CTL6_CA55STBYDONE_E_Msk                                  (0x00000020UL)
#define R_SYSC_SYS_LP_CTL6_CA55STBYDONE_E_Pos                                  (5UL)
#define R_SYSC_SYS_LP_CTL6_CM33STBYR_E_Msk                                     (0x00000040UL)
#define R_SYSC_SYS_LP_CTL6_CM33STBYR_E_Pos                                     (6UL)
#define R_SYSC_SYS_LP_CTL6_CA55SLEEP0_E_Msk                                    (0x00000100UL)
#define R_SYSC_SYS_LP_CTL6_CA55SLEEP0_E_Pos                                    (8UL)
#define R_SYSC_SYS_LP_CTL6_CA55SLEEP1_E_Msk                                    (0x00000200UL)
#define R_SYSC_SYS_LP_CTL6_CA55SLEEP1_E_Pos                                    (9UL)
#define R_SYSC_SYS_LP_CTL6_CM33SLEEP_E_Msk                                     (0x00000400UL)
#define R_SYSC_SYS_LP_CTL6_CM33SLEEP_E_Pos                                     (10UL)
#define R_SYSC_SYS_LP_CTL7_IM33_MASK_Msk                                       (0x00000001UL)
#define R_SYSC_SYS_LP_CTL7_IM33_MASK_Pos                                       (0UL)
#define R_SYSC_SYS_LP_CTL8_SUBCPU_RTRIG_Msk                                    (0x00000001UL)
#define R_SYSC_SYS_LP_CTL8_SUBCPU_RTRIG_Pos                                    (0UL)
#define R_SYSC_SYS_LP_CM33CTL0_SLEEPMODE_Msk                                   (0x00000001UL)
#define R_SYSC_SYS_LP_CM33CTL0_SLEEPMODE_Pos                                   (0UL)
#define R_SYSC_SYS_LP_CM33CTL0_SLEEPDEEP_Msk                                   (0x00000010UL)
#define R_SYSC_SYS_LP_CM33CTL0_SLEEPDEEP_Pos                                   (4UL)
#define R_SYSC_SYS_LP_CM33CTL0_SYSRESETREQ_Msk                                 (0x00000200UL)
#define R_SYSC_SYS_LP_CM33CTL0_SYSRESETREQ_Pos                                 (9UL)
#define R_SYSC_SYS_LP_CM33CTL0_WICENABLEREQ_Msk                                (0x01000000UL)
#define R_SYSC_SYS_LP_CM33CTL0_WICENABLEREQ_Pos                                (24UL)
#define R_SYSC_SYS_LP_CM33CTL0_WICENABLEACK_Msk                                (0x02000000UL)
#define R_SYSC_SYS_LP_CM33CTL0_WICENABLEACK_Pos                                (25UL)
#define R_SYSC_SYS_LP_CA55CK_CTL1_ASCLKQACTIVE_Msk                             (0x00000002UL)
#define R_SYSC_SYS_LP_CA55CK_CTL1_ASCLKQACTIVE_Pos                             (1UL)
#define R_SYSC_SYS_LP_CA55CK_CTL1_AMCLKQACTIVE_Msk                             (0x00000004UL)
#define R_SYSC_SYS_LP_CA55CK_CTL1_AMCLKQACTIVE_Pos                             (2UL)
#define R_SYSC_SYS_LP_CA55CK_CTL1_PCLKQACTIVE_Msk                              (0x00000100UL)
#define R_SYSC_SYS_LP_CA55CK_CTL1_PCLKQACTIVE_Pos                              (8UL)
#define R_SYSC_SYS_LP_CA55CK_CTL1_ATCLKQACTIVE_Msk                             (0x00000200UL)
#define R_SYSC_SYS_LP_CA55CK_CTL1_ATCLKQACTIVE_Pos                             (9UL)
#define R_SYSC_SYS_LP_CA55CK_CTL1_GICCLKQACTIVE_Msk                            (0x00000400UL)
#define R_SYSC_SYS_LP_CA55CK_CTL1_GICCLKQACTIVE_Pos                            (10UL)
#define R_SYSC_SYS_LP_CA55CK_CTL1_PDBGCLKQACTIVE_Msk                           (0x00000800UL)
#define R_SYSC_SYS_LP_CA55CK_CTL1_PDBGCLKQACTIVE_Pos                           (11UL)
#define R_SYSC_SYS_LP_CA55CK_CTL2_ASCLKQREQn_Msk                               (0x00000002UL)
#define R_SYSC_SYS_LP_CA55CK_CTL2_ASCLKQREQn_Pos                               (1UL)
#define R_SYSC_SYS_LP_CA55CK_CTL2_AMCLKQREQn_Msk                               (0x00000004UL)
#define R_SYSC_SYS_LP_CA55CK_CTL2_AMCLKQREQn_Pos                               (2UL)
#define R_SYSC_SYS_LP_CA55CK_CTL2_PCLKQREQn_Msk                                (0x00000100UL)
#define R_SYSC_SYS_LP_CA55CK_CTL2_PCLKQREQn_Pos                                (8UL)
#define R_SYSC_SYS_LP_CA55CK_CTL2_ATCLKQREQn_Msk                               (0x00000200UL)
#define R_SYSC_SYS_LP_CA55CK_CTL2_ATCLKQREQn_Pos                               (9UL)
#define R_SYSC_SYS_LP_CA55CK_CTL2_GICCLKQREQn_Msk                              (0x00000400UL)
#define R_SYSC_SYS_LP_CA55CK_CTL2_GICCLKQREQn_Pos                              (10UL)
#define R_SYSC_SYS_LP_CA55CK_CTL2_PDBGCLKQREQn_Msk                             (0x00000800UL)
#define R_SYSC_SYS_LP_CA55CK_CTL2_PDBGCLKQREQn_Pos                             (11UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_CA55_COREINSTRRUN0_Msk                       (0x00000001UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_CA55_COREINSTRRUN0_Pos                       (0UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_ASCLKQACCEPTn_Msk                            (0x00000002UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_ASCLKQACCEPTn_Pos                            (1UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_AMCLKQACCEPTn_Msk                            (0x00000004UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_AMCLKQACCEPTn_Pos                            (2UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_PCLKQACCEPTn_Msk                             (0x00000100UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_PCLKQACCEPTn_Pos                             (8UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_ATCLKQACCEPTn_Msk                            (0x00000200UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_ATCLKQACCEPTn_Pos                            (9UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_GICCLKQACCEPTn_Msk                           (0x00000400UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_GICCLKQACCEPTn_Pos                           (10UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_PDBGCLKQACCEPTn_Msk                          (0x00000800UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_PDBGCLKQACCEPTn_Pos                          (11UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_CA55_COREINSTRRUN1_Msk                       (0x00010000UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_CA55_COREINSTRRUN1_Pos                       (16UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_ASCLKQDENY_Msk                               (0x00020000UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_ASCLKQDENY_Pos                               (17UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_AMCLKQDENY_Msk                               (0x00040000UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_AMCLKQDENY_Pos                               (18UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_PCLKQDENY_Msk                                (0x01000000UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_PCLKQDENY_Pos                                (24UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_ATCLKQDENY_Msk                               (0x02000000UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_ATCLKQDENY_Pos                               (25UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_GICCLKQDENY_Msk                              (0x04000000UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_GICCLKQDENY_Pos                              (26UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_PDBGCLKQDENY_Msk                             (0x08000000UL)
#define R_SYSC_SYS_LP_CA55CK_CTL3_PDBGCLKQDENY_Pos                             (27UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACTIVE_GPU_Msk                                  (0x00000001UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACTIVE_GPU_Pos                                  (0UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACTIVE_AXI_SLV_Msk                              (0x00000002UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACTIVE_AXI_SLV_Pos                              (1UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACTIVE_AXI_MST_Msk                              (0x00000004UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACTIVE_AXI_MST_Pos                              (2UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACTIVE_ACE_SLV_Msk                              (0x00000008UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACTIVE_ACE_SLV_Pos                              (3UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACTIVE_ACE_MST_Msk                              (0x00000010UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACTIVE_ACE_MST_Pos                              (4UL)
#define R_SYSC_SYS_LP_GPU_CTL_QREQn_GPU_Msk                                    (0x00000100UL)
#define R_SYSC_SYS_LP_GPU_CTL_QREQn_GPU_Pos                                    (8UL)
#define R_SYSC_SYS_LP_GPU_CTL_QREQn_AXI_SLV_Msk                                (0x00000200UL)
#define R_SYSC_SYS_LP_GPU_CTL_QREQn_AXI_SLV_Pos                                (9UL)
#define R_SYSC_SYS_LP_GPU_CTL_QREQn_AXI_MST_Msk                                (0x00000400UL)
#define R_SYSC_SYS_LP_GPU_CTL_QREQn_AXI_MST_Pos                                (10UL)
#define R_SYSC_SYS_LP_GPU_CTL_QREQn_ACE_SLV_Msk                                (0x00000800UL)
#define R_SYSC_SYS_LP_GPU_CTL_QREQn_ACE_SLV_Pos                                (11UL)
#define R_SYSC_SYS_LP_GPU_CTL_QREQn_ACE_MST_Msk                                (0x00001000UL)
#define R_SYSC_SYS_LP_GPU_CTL_QREQn_ACE_MST_Pos                                (12UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACCEPTn_GPU_Msk                                 (0x00010000UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACCEPTn_GPU_Pos                                 (16UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACCEPTn_AXI_SLV_Msk                             (0x00020000UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACCEPTn_AXI_SLV_Pos                             (17UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACCEPTn_AXI_MST_Msk                             (0x00040000UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACCEPTn_AXI_MST_Pos                             (18UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACCEPTn_ACE_SLV_Msk                             (0x00080000UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACCEPTn_ACE_SLV_Pos                             (19UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACCEPTn_ACE_MST_Msk                             (0x00100000UL)
#define R_SYSC_SYS_LP_GPU_CTL_QACCEPTn_ACE_MST_Pos                             (20UL)
#define R_SYSC_SYS_LP_GPU_CTL_QDENY_GPU_Msk                                    (0x01000000UL)
#define R_SYSC_SYS_LP_GPU_CTL_QDENY_GPU_Pos                                    (24UL)
#define R_SYSC_SYS_LP_GPU_CTL_QDENY_AXI_SLV_Msk                                (0x02000000UL)
#define R_SYSC_SYS_LP_GPU_CTL_QDENY_AXI_SLV_Pos                                (25UL)
#define R_SYSC_SYS_LP_GPU_CTL_QDENY_AXI_MST_Msk                                (0x04000000UL)
#define R_SYSC_SYS_LP_GPU_CTL_QDENY_AXI_MST_Pos                                (26UL)
#define R_SYSC_SYS_LP_GPU_CTL_QDENY_ACE_SLV_Msk                                (0x08000000UL)
#define R_SYSC_SYS_LP_GPU_CTL_QDENY_ACE_SLV_Pos                                (27UL)
#define R_SYSC_SYS_LP_GPU_CTL_QDENY_ACE_MST_Msk                                (0x10000000UL)
#define R_SYSC_SYS_LP_GPU_CTL_QDENY_ACE_MST_Pos                                (28UL)
#define R_SYSC_SYS_GPREG_0_GPREG0_Msk                                          (0xFFFFFFFFUL)
#define R_SYSC_SYS_GPREG_0_GPREG0_Pos                                          (0UL)
#define R_SYSC_SYS_GPREG_1_GPREG1_Msk                                          (0xFFFFFFFFUL)
#define R_SYSC_SYS_GPREG_1_GPREG1_Pos                                          (0UL)
#define R_SYSC_SYS_GPREG_2_GPREG2_Msk                                          (0xFFFFFFFFUL)
#define R_SYSC_SYS_GPREG_2_GPREG2_Pos                                          (0UL)
#define R_SYSC_SYS_GPREG_3_GPREG3_Msk                                          (0xFFFFFFFFUL)
#define R_SYSC_SYS_GPREG_3_GPREG3_Pos                                          (0UL)

#endif

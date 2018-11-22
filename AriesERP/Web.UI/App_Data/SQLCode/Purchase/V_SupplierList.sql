(--供应商列表

select d23.rkey,d23.code,d23.supplier_name,d23.abbr_name,d23.status,
d23.brother_flag,d23.ADDRESS2_FOR_FORM,d23.ADDRESS1_FOR_FORM,d23.ttype,
d23.EDI_OUT_NEW_PO,d23.suppier_ent_date,d23.contact_name_1 ,
d23.cont_phone_1,d23.phone,d23.fax,d23.telex,d23.state,d23.zip,
d01.curr_name,d250.country_name,d05.employee_name,d23.update_date,
d23.billing_address_1,d23.tax_id_number,d23.developer,d23.invalid_explain,
d23.po_note_pad_ptr,d23.debmem_note_pad_ptr,d23.rfq_note_pad_ptr,d23.common_pad_ptr,
d23.analysis_code1,d23.EDI_FLAG_FOR_PO, d23.Remark, d23.RemarkSpec,
d23.contact_name_2,d23.contact_name_3,d23.contact_name_4,d23.contact_name_5,d23.contact_name_6,
d23.cont_phone_2,d23.cont_phone_3,d23.cont_phone_4,d23.cont_phone_5,d23.cont_phone_6,
d23.email_for_contact1,d23.email_for_contact2,d23.email_for_contact3,d23.email_for_contact4,
d23.email_for_contact5,d23.email_for_contact6,d23.LANGUAGE_FLAG,d23.EDI_ID,
d23.payment_terms,d23.discount,d23.discount_days,d23.discount2,d23.discount2_days,d23.put_all_inv_hold,
d23.analysis_code2,d23.analysis_code3,d23.gen_email_address,d23.TAX_2,d23.TAX_1,
d23.currency_ptr,d23.country_ptr,d23.acc_payable_ptr,d23.user_ptr,
d103.GL_ACC_NUMBER,d103.gl_description,case when AttachFile is not null then 'Y' else 'N' end as isfile

from Data0023 d23 inner join data0001 d01 on d23.currency_ptr=d01.rkey
left join data0250 d250 on d23.country_ptr=d250.country_rkey
left join data0005 d05 on d23.user_ptr=d05.rkey 
left join data0103 d103 on d23.acc_payable_ptr=d103.rkey
) a
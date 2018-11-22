unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB, Provider, DBClient;

type
  TDM = class(TDataModule)
    adoConn: TADOConnection;
    dsBrowse: TDataSource;
    adsBrowse: TADODataSet;
    aqTmp: TADOQuery;
    adsBrowserkey: TIntegerField;
    adsBrowserkey25: TIntegerField;
    adsBrowsedept_ptr: TIntegerField;
    adsBrowselam2: TStringField;
    adsBrowselam_ty_gp: TStringField;
    adsBrowseTTYPE: TWordField;
    adsBrowsemanuf_qty: TIntegerField;
    adsBrowsepanel_qty: TIntegerField;
    adsBrowsepp_quota_len: TBCDField;
    adsBrowseempl_ptr: TIntegerField;
    adsBrowsecreare_date: TDateTimeField;
    adsBrowseconfirm_ptr: TIntegerField;
    adsBrowseconfirm_time: TDateTimeField;
    adsBrowseTSTATUS: TWordField;
    adsBrowseprint_flag: TBooleanField;
    adsBrowseqg_flag: TBooleanField;
    adsBrowseremark: TWideStringField;
    adsBrowseMANU_PART_NUMBER: TStringField;
    adsBrowseMANU_PART_DESC: TStringField;
    adsBrowseDEPT_CODE: TStringField;
    adsBrowseDEPT_NAME: TStringField;
    adsBrowseDSDesigner: TStringField;
    adsBrowseDSDesigner2: TStringField;
    adsBrowseDSDesigner3: TStringField;
    adsBrowseDSDesigner4: TStringField;
    adsBrowseDSDesigner5: TStringField;
    adsBrowseDSDesigner6: TStringField;
    aqFindWO: TADOQuery;
    dsFindWO: TDataSource;
    aqFindWOIsSelected: TWordField;
    aqFindWOWORK_ORDER_NUMBER: TStringField;
    aqFindWOMANU_PART_NUMBER: TStringField;
    aqFindWOMANU_PART_DESC: TStringField;
    aqFindWOPANELS: TIntegerField;
    aqFindWOSTEP: TSmallintField;
    aqFindWODEPT_CODE: TStringField;
    aqFindWODEPT_NAME: TStringField;
    aqFindWODSDesigner: TStringField;
    cdsFindWO: TClientDataSet;
    dspFindWO: TDataSetProvider;
    cdsFindWOIsSelected: TSmallintField;
    cdsFindWOWORK_ORDER_NUMBER: TStringField;
    cdsFindWOMANU_PART_NUMBER: TStringField;
    cdsFindWOMANU_PART_DESC: TStringField;
    cdsFindWOPANELS: TIntegerField;
    cdsFindWOSTEP: TSmallintField;
    cdsFindWODEPT_CODE: TStringField;
    cdsFindWODEPT_NAME: TStringField;
    cdsFindWOCDSDesigner: TStringField;
    aspBuild: TADOStoredProc;
    aqFindWORKEY: TAutoIncField;
    cdsFindWORKEY: TAutoIncField;
    aq731: TADOQuery;
    aq732: TADOQuery;
    ds731: TDataSource;
    ds732: TDataSource;
    aq731rkey: TAutoIncField;
    aq731rkey25: TIntegerField;
    aq731dept_ptr: TIntegerField;
    aq731lam2: TStringField;
    aq731lam_ty_gp: TStringField;
    aq731TTYPE: TWordField;
    aq731manuf_qty: TIntegerField;
    aq731panel_qty: TIntegerField;
    aq731pp_quota_len: TBCDField;
    aq731empl_ptr: TIntegerField;
    aq731creare_date: TDateTimeField;
    aq731confirm_ptr: TIntegerField;
    aq731confirm_time: TDateTimeField;
    aq731TSTATUS: TWordField;
    aq731print_flag: TBooleanField;
    aq731qg_flag: TBooleanField;
    aq731matrece_flag: TBooleanField;
    aq731remark: TWideStringField;
    aq05: TADOQuery;
    aq25: TADOQuery;
    aq05EMPL_CODE: TStringField;
    aq05EMPLOYEE_NAME: TStringField;
    aq25MANU_PART_NUMBER: TStringField;
    aq25MANU_PART_DESC: TStringField;
    aq34: TADOQuery;
    aq34DEPT_CODE: TStringField;
    aq34DEPT_NAME: TStringField;
    aq05_1: TADOQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    ds05: TDataSource;
    ds05_1: TDataSource;
    ds25: TDataSource;
    ds34: TDataSource;
    aqProcParam: TADOQuery;
    aqProcParamseq_no: TSmallintField;
    aqProcParamPARAMETER_PTR: TIntegerField;
    aqProcParamPARAMETER_NAME: TStringField;
    aqProcParamPARAMETER_DESC: TStringField;
    aqProcParamPARAMETER_VALUE: TStringField;
    dsProcParam: TDataSource;
    aq25layers_image: TBlobField;
    aq732manuf_qty: TIntegerField;
    aq732pp_quota: TIntegerField;
    aq732panel_qty: TIntegerField;
    aq732panel_ln: TBCDField;
    aq732panel_wd: TBCDField;
    aq732PP_TYP: TStringField;
    aq732pp_rc: TStringField;
    aq732pp_tg: TStringField;
    aq732pp_quota_len: TBCDField;
    aq732pp_quota_roll: TBCDField;
    aq732qg_flag: TBooleanField;
    aq732remark: TWideStringField;
    aq732rkey: TAutoIncField;
    aq732rkey731: TIntegerField;
    aq732rkey06: TIntegerField;
    aq732rkey17: TIntegerField;
    aq732qg: TStringField;
    aq17: TADOQuery;
    aq06: TADOQuery;
    aq17RKEY: TAutoIncField;
    aq17INV_PART_NUMBER: TStringField;
    aq17INV_PART_DESCRIPTION: TStringField;
    aq17INV_NAME: TStringField;
    aq17INV_DESCRIPTION: TStringField;
    aq732INV_PART_NUMBER: TStringField;
    aq732INV_PART_DESCRIPTION: TStringField;
    aq06RKEY: TAutoIncField;
    aq06WORK_ORDER_NUMBER: TStringField;
    aq732WORK_ORDER_NUMBER: TStringField;
    aq17IES_PARAMETER_VALUE2: TStringField;
    aq17IES_PARAMETER_VALUE3: TStringField;
    aq732IES_PARAMETER_VALUE2: TStringField;
    aq732IES_PARAMETER_VALUE3: TStringField;
    adsBrowsematrece_flag: TBooleanField;
    adsBrowseDSDesigner7: TStringField;
    aq732matrece_flag: TBooleanField;
    aq732matrece: TStringField;
    aq25layers_info: TMemoField;
    aqFindWORKEY25: TAutoIncField;
    cdsFindWORKEY25: TAutoIncField;
    dsFindWO1: TDataSource;
    aqFindWO1: TADOQuery;
    aqFindWO1DSDesigner: TStringField;
    aqFindWO1DSDesigner2: TStringField;
    aqFindWO1DSDesigner3: TStringField;
    aqFindWO1PNL: TIntegerField;
    aqFindWO1DSDesigner4: TSmallintField;
    aqFindWO1DSDesigner5: TStringField;
    aqFindWO1DSDesigner6: TStringField;
    aqFindWO1DSDesigner7: TStringField;
    dsBrowse1: TDataSource;
    aqBrowse1: TADOQuery;
    aqBrowse1rkey: TAutoIncField;
    aqBrowse1rkey731: TIntegerField;
    aqBrowse1rkey06: TIntegerField;
    aqBrowse1rkey17: TIntegerField;
    aqBrowse1manuf_qty: TIntegerField;
    aqBrowse1pp_quota: TIntegerField;
    aqBrowse1panel_qty: TIntegerField;
    aqBrowse1panel_ln: TBCDField;
    aqBrowse1panel_wd: TBCDField;
    aqBrowse1PP_TYP: TStringField;
    aqBrowse1pp_rc: TStringField;
    aqBrowse1pp_tg: TStringField;
    aqBrowse1pp_quota_len: TBCDField;
    aqBrowse1pp_quota_roll: TBCDField;
    aqBrowse1qg_flag: TBooleanField;
    aqBrowse1matrece_flag: TBooleanField;
    aqBrowse1remark: TWideStringField;
    aqBrowse1WORK_ORDER_NUMBER: TStringField;
    aqBrowse1INV_PART_NUMBER: TStringField;
    aqBrowse1INV_PART_DESCRIPTION: TStringField;
    aq25CURRENT_REV: TStringField;
    procedure aq731AfterScroll(DataSet: TDataSet);
    procedure aq731rkey25Change(Sender: TField);
    procedure aq731dept_ptrChange(Sender: TField);
    procedure aq731empl_ptrChange(Sender: TField);
    procedure aq731confirm_ptrChange(Sender: TField);
    procedure aq732CalcFields(DataSet: TDataSet);
    procedure aq732rkey17Change(Sender: TField);
    procedure aq732manuf_qtyChange(Sender: TField);
    procedure adsBrowseAfterScroll(DataSet: TDataSet);
    procedure adsBrowseAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses uBrowse, uDetail;

{$R *.dfm}


procedure TDM.aq731AfterScroll(DataSet: TDataSet);
begin
  with aq732 do
  begin
    Close;
    Parameters.ParamByName('RKEY731').Value:= aq731rkey.Value;
    Open;
  end;

  with aq25 do
  begin
    Close;
    Parameters.ParamByName('RKEY25').Value:= aq731rkey25.Value;
    Open;
  end;
  with aqProcParam do
  begin
    Close;
    Parameters.ParamByName('RKEY25').Value:= aq731rkey25.Value;
    Parameters.ParamByName('RKEY34').Value:= aq731dept_ptr.Value;
    Open;
  end;
  with aq34 do
  begin
    Close;
    Parameters.ParamByName('RKEY34').Value:= aq731dept_ptr.Value;
    Open;
  end;
  with aq05 do
  begin
    Close;
    Parameters.ParamByName('RKEY05').Value:= aq731empl_ptr.Value;
    Open;
  end;
  with aq05_1 do
  begin
    Close;
    Parameters.ParamByName('RKEY05').Value:= aq731confirm_ptr.Value;
    Open;
  end;  
end;

procedure TDM.aq731rkey25Change(Sender: TField);
begin
  with aq25 do
  begin
    Close;
    Parameters.ParamByName('RKEY25').Value:= aq731rkey25.Value;
    Open;
  end;
  with aqProcParam do
  begin
    Close;
    Parameters.ParamByName('RKEY25').Value:= aq731rkey25.Value;
    Parameters.ParamByName('RKEY34').Value:= aq731dept_ptr.Value;
    Open;
  end;
end;

procedure TDM.aq731dept_ptrChange(Sender: TField);
begin
  with aq34 do
  begin
    Close;
    Parameters.ParamByName('RKEY34').Value:= aq731dept_ptr.Value;
    Open;
  end;
  with aqProcParam do
  begin
    Close;
    Parameters.ParamByName('RKEY25').Value:= aq731rkey25.Value;
    Parameters.ParamByName('RKEY34').Value:= aq731dept_ptr.Value;
    Open;
  end;  
end;

procedure TDM.aq731empl_ptrChange(Sender: TField);
begin
  with aq05 do
  begin
    Close;
    Parameters.ParamByName('RKEY05').Value:= aq731empl_ptr.Value;
    Open;
  end;
end;

procedure TDM.aq731confirm_ptrChange(Sender: TField);
begin
  with aq05_1 do
  begin
    Close;
    Parameters.ParamByName('RKEY05').Value:= aq731confirm_ptr.Value;
    Open;
  end;
end;

procedure TDM.aq732CalcFields(DataSet: TDataSet);
begin
  if aq732.FieldByName('qg_flag').AsBoolean then
    aq732.FieldByName('qg').AsString:='ÊÇ'
  else
    aq732.FieldByName('qg').AsString:='·ñ';
  if aq732.FieldByName('matrece_flag').AsBoolean then
    aq732.FieldByName('matrece').AsString:='ÊÇ'
  else
    aq732.FieldByName('matrece').AsString:='·ñ';
end;

procedure TDM.aq732rkey17Change(Sender: TField);
begin
  aq732.FieldByName('pp_quota_len').AsFloat:=0;
  aq732.FieldByName('pp_quota_roll').AsFloat:=0;
end;

procedure TDM.aq732manuf_qtyChange(Sender: TField);
begin
  aq732.FieldByName('panel_qty').AsInteger:=aq732.FieldByName('manuf_qty').AsInteger*aq732.FieldByName('pp_quota').AsInteger;
  if not aq732.FieldByName('rkey17').IsNull then
  begin
    if not (aq732.State in[dsInsert, dsEdit]) then aq732.Edit;
    aq732.FieldByName('pp_quota_len').AsFloat:= frmDetail.CalcPP(25.4*aq732.FieldByName('IES_PARAMETER_VALUE2').AsFloat);
    if aq732.FieldByName('IES_PARAMETER_VALUE3').AsFloat-2<>0 then
      aq732.FieldByName('pp_quota_roll').AsFloat:= aq732.FieldByName('pp_quota_len').AsFloat/(aq732.FieldByName('IES_PARAMETER_VALUE3').AsFloat-2)
    else
      aq732.FieldByName('pp_quota_roll').AsFloat:= 0;
  end;
end;

procedure TDM.adsBrowseAfterScroll(DataSet: TDataSet);
begin
  with aqBrowse1 do
  begin
    Close;
    Parameters.ParamByName('RKEY731').Value:= adsBrowserkey.Value;
    Open;
  end;
end;

procedure TDM.adsBrowseAfterOpen(DataSet: TDataSet);
begin
  if adsBrowse.RecordCount=0 then aqBrowse1.Close;
end;

end.

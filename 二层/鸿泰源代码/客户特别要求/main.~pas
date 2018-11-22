unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGridEh, ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    DBGridEh1: TDBGridEh;
    Ads10: TADODataSet;
    DataSource1: TDataSource;
    Ads10RKEY: TAutoIncField;
    Ads10CUST_CODE: TStringField;
    Ads10CUSTOMER_NAME: TStringField;
    Ads10ABBR_NAME: TStringField;
    Ads10BILLING_ADDRESS_1: TStringField;
    Ads10BILLING_ADDRESS_2: TStringField;
    Ads10BILLING_ADDRESS_3: TStringField;
    Ads10STATE: TStringField;
    Ads10ZIP: TStringField;
    Ads10PHONE: TStringField;
    Ads10FAX: TStringField;
    Ads10TELEX: TStringField;
    Ads10SALES_REP_PTR: TIntegerField;
    Ads10CURRENCY_PTR: TIntegerField;
    Ads10INVOICE_NOTE_PAD_PTR: TIntegerField;
    Ads10CONTACT_NAME_1: TStringField;
    Ads10CONTACT_NAME_2: TStringField;
    Ads10CONTACT_NAME_3: TStringField;
    Ads10CONTACT_NAME_4: TStringField;
    Ads10CONTACT_NAME_5: TStringField;
    Ads10CONTACT_NAME_6: TStringField;
    Ads10CONT_PHONE_1: TStringField;
    Ads10CONT_PHONE_2: TStringField;
    Ads10CONT_PHONE_3: TStringField;
    Ads10CONT_PHONE_4: TStringField;
    Ads10CONT_PHONE_5: TStringField;
    Ads10CONT_PHONE_6: TStringField;
    Ads10FED_TAX_ID_NO: TStringField;
    Ads10COFC_FILENAME: TStringField;
    Ads10COD_FLAG: TStringField;
    Ads10REG_TAX_FIXED_UNUSED: TStringField;
    Ads10DISCOUNT_PCT: TBCDField;
    Ads10HIGH_BALANCE: TFloatField;
    Ads10CREDIT_LIMIT: TFloatField;
    Ads10CREDIT_RATING: TWordField;
    Ads10BALANCE_DUE: TFloatField;
    Ads10OUTSTANDING_CREDIT: TFloatField;
    Ads10DISCOUNT_DAYS: TSmallintField;
    Ads10CURRENT_BOOKINGS: TFloatField;
    Ads10NET_PAY: TSmallintField;
    Ads10LAST_ACTIVE_DATE: TDateTimeField;
    Ads10LANGUAGE_FLAG: TStringField;
    Ads10BILLING_ADDRESS_4: TStringField;
    Ads10COUNTRY_PTR: TIntegerField;
    Ads10INTERNAL_ECN_COUNT: TSmallintField;
    Ads10EXTERNAL_ECN_COUNT: TSmallintField;
    Ads10OUTGOING_FORM_NAME: TStringField;
    Ads10OUTGOING_FORM_ADDR1: TStringField;
    Ads10OUTGOING_FORM_ADDR2: TStringField;
    Ads10OUTGOING_FORM_ADDR3: TStringField;
    Ads10ANALYSIS_CODE1: TStringField;
    Ads10ANALYSIS_CODE2: TStringField;
    Ads10ANALYSIS_CODE3: TStringField;
    Ads10CUST_ENT_DATE: TDateTimeField;
    Ads10EDI_ID: TStringField;
    Ads10EDI_FLAG_FOR_SOACK: TSmallintField;
    Ads10EDI_FLAG_FOR_INVOICE: TSmallintField;
    Ads10EDI_FLAG_CREDIT_MEMO: TSmallintField;
    Ads10GEN_EMAIL_ADDRESS: TStringField;
    Ads10EMAIL_FOR_CONTACT1: TStringField;
    Ads10EMAIL_FOR_CONTACT2: TStringField;
    Ads10EMAIL_FOR_CONTACT3: TStringField;
    Ads10EMAIL_FOR_CONTACT4: TStringField;
    Ads10EMAIL_FOR_CONTACT5: TStringField;
    Ads10EMAIL_FOR_CONTACT6: TStringField;
    Ads10ACC_REC_PTR: TIntegerField;
    Ads10CONSUME_FORECASTS: TWordField;
    Ads10BACKWARD_DAYS: TIntegerField;
    Ads10FORWARD_DAYS: TIntegerField;
    Ads10PLANNING_HORIZON: TIntegerField;
    Ads10RAW_HORIZON: TIntegerField;
    Ads10VISIBILITY_HORIZON: TIntegerField;
    Ads10DAYS_EARLY_SCHEDULE: TIntegerField;
    Ads10APPLY_IN_TRANSIT: TWordField;
    Ads10CUSTOMER_TYPE: TIntegerField;
    Ads10DO_SMOOTHING: TWordField;
    Ads10SMOOTHING_THRESHOLD: TIntegerField;
    Ads10ANALYSIS_CODE4: TStringField;
    Ads10ANALYSIS_CODE5: TStringField;
    Ads10EDI_IN_LOGGING: TWordField;
    Ads10quote_factor: TFloatField;
    Ads10QUOTE_FACTOR1: TFloatField;
    Ads10REP_EVAL: TStringField;
    Ads10MAK_EVAL: TStringField;
    Ads10FIN_EVAL: TStringField;
    Ads10MARMANG_EVAL: TStringField;
    Ads10REP_CREDIT: TFloatField;
    Ads10MAK_CREDIT: TFloatField;
    Ads10FIN_CREDIT: TFloatField;
    Ads10MARMANG_CREDIT: TFloatField;
    Ads10REP_HIGH: TFloatField;
    Ads10MAK_HIGH: TFloatField;
    Ads10FIN_HIGH: TFloatField;
    Ads10MARMANG_HIGH: TFloatField;
    Ads10REP_NAME: TStringField;
    Ads10MAK_NAME: TStringField;
    Ads10FIN_NAME: TStringField;
    Ads10MARMANG_NAME: TStringField;
    Ads10REP_DATE: TDateTimeField;
    Ads10MAK_DATE: TDateTimeField;
    Ads10FIN_DATE: TDateTimeField;
    Ads10MARMANG_DATE: TDateTimeField;
    Ads10HOUSE_FIXED: TStringField;
    Ads10FIXED_SCOPE: TStringField;
    Ads10SALES_DISCOUNT: TBCDField;
    Ads10MONTH_AMOUNT: TFloatField;
    Ads10MONTH_PCBAMOUNT: TFloatField;
    Ads10CAPITAL: TFloatField;
    Ads10INVOICE_TYPE: TStringField;
    Ads10quote_flag: TBooleanField;
    procedure Button3Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Ads10AfterScroll(DataSet: TDataSet);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
   preColumn:TColumnEh;
   rkey10: integer;
   v_close: boolean;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses common;
{$R *.dfm}

procedure TForm1.Button3Click(Sender: TObject);
begin
 if (v_close=true) and (trim(memo1.Text)<>'') then
 case messagedlg('数据被修改是否保存?',mtconfirmation,[mbyes,mbno,mbcancel],0) of
  mryes :
   begin
    button1click(sender);
    application.Terminate;
   end;
  mrno : application.Terminate;
  mrCancel :memo1.SetFocus;
 end
else
 application.Terminate;
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then memo1.SetFocus;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
//if (trim(edit1.Text) <> '') and ((activecontrol.Name<>'Button3')) then
// begin
//  if (v_close=true) and (trim(memo1.Text)<>'') and
//     (messagedlg('先前有数据被修改是否保存?',mtconfirmation,[mbyes,mbno],0)=mryes) then
//   button1click(sender);
//  with adoquery1 do
//   begin
//    close;
//    sql.Clear;
//    sql.Add('select rkey,customer_name from data0010 where cust_code='''+trim(edit1.Text)+'''');
//    open;
//   end;
//  if adoquery1.IsEmpty then
//   begin
//    showmessage('对不起!没有找到对应的客户,请确认客户代码是否正确');
//    edit1.SetFocus;
//   end
//  else
//   begin
//    self.Caption:='客户特别要求: '+adoquery1.FieldValues['customer_name'];
//    rkey10:=adoquery1.FieldValues['rkey'];
//    memo1.ReadOnly:=false;
//    button1.Enabled:=true;
//    button2.Enabled:=true;
//    with adoquery1 do
//     begin
//      close;
//      sql.Clear;
//      sql.Add('select * from data0011 where SOURCE_TYPE=6010');
//      sql.Add('and FILE_POINTER='+inttostr(rkey10));
//      open;
//     end;
//    if not adoquery1.IsEmpty then
//     memo1.Text:=adoquery1.FieldValues['memo_text']
//    else
//     memo1.Lines.Text:='';
//     v_close:=false;
//   end;
// end
//else
//if (trim(edit1.Text) = '') and ((activecontrol.Name<>'Button3')) then
// begin
//  if (v_close=true) and (trim(memo1.Text)<>'') and
//     (messagedlg('先前有数据被修改是否保存?',mtconfirmation,[mbyes,mbno],0)=mryes) then
//   button1click(sender);
//  self.Caption:='客户特别要求: ';
//  if button1.Enabled=true then button1.Enabled:=false;
//  if button2.Enabled=true then button2.Enabled:=false;
//  memo1.Text:='';
//  v_close:=false;
//  memo1.ReadOnly:=true;
// end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 if (adoquery1.IsEmpty) and (trim(memo1.Text)<>'') then
  begin
   adoquery1.append;
   adoquery1.FieldValues['file_pointer']:=rkey10;
   adoquery1.FieldValues['source_type']:=6010;
   adoquery1.Fieldvalues['memo_text']:=memo1.Lines.Text;
   adoquery1.Post;
   v_close:=false;
   showmessage('数据保存成功');
  end
 else
  if (not adoquery1.IsEmpty) and (trim(memo1.Text)<>'') then
   begin
    adoquery1.Edit;
    adoquery1.FieldValues['memo_text']:=memo1.Text;
    adoquery1.Post;
    v_close:=false;
    showmessage('数据保存成功');
   end
  else
   if (not adoquery1.IsEmpty) and (trim(memo1.Text)='') then
    begin
     adoquery1.Delete;
     v_close:=false;
     showmessage('数据保存成功');
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 if not adoquery1.IsEmpty then
  memo1.Lines.Text:=adoquery1.FieldValues['memo_text']
 else
  memo1.Lines.Text:='';
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if (v_close=true) and (trim(memo1.Text)<>'') then
 case messagedlg('数据被修改是否保存?',mtconfirmation,[mbyes,mbno,mbcancel],0) of
  mryes : button1click(sender);
  mrno :;
  mrCancel :canclose:=false
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
if not app_init_2(ADOConnection1) then
 begin
   ShowMsg('程序起动失败请联系管理员',1);
   application.Terminate;  
 end;
 self.Caption:=application.title;
end;

procedure TForm1.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
v_close:=true;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Ads10.Close;
  Ads10.Open;
  preColumn:=DBGridEh1.Columns[0];
end;

procedure TForm1.Ads10AfterScroll(DataSet: TDataSet);
begin
//  if (trim(edit1.Text) <> '') and ((activecontrol.Name<>'Button3')) then
//  begin
    if (v_close=true) and (trim(memo1.Text)<>'') and
       (messagedlg('先前有数据被修改是否保存?',mtconfirmation,[mbyes,mbno],0)=mryes) then
      button1click(Self);
    with adoquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select rkey,customer_name from data0010 where cust_code='''+ Ads10CUST_CODE.AsString +'''');
      open;
    end;
    if adoquery1.IsEmpty then
    begin
      showmessage('对不起!没有找到对应的客户,请确认客户代码是否正确');
//      edit1.SetFocus;
    end
    else
    begin
      self.Caption:='客户特别要求: '+adoquery1.FieldValues['customer_name'];
      rkey10:=adoquery1.FieldValues['rkey'];
      memo1.ReadOnly:=false;
      button1.Enabled:=true;
      button2.Enabled:=true;
      with adoquery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from data0011 where SOURCE_TYPE=6010');
        sql.Add('and FILE_POINTER='+inttostr(rkey10));
        open;
      end;
      if not adoquery1.IsEmpty then
        memo1.Text:=adoquery1.FieldValues['memo_text']
      else
        memo1.Lines.Text:='';
       v_close:=false;
    end;
//  end
//  else
//  if (trim(edit1.Text) = '') and ((activecontrol.Name<>'Button3')) then
//  begin
//    if (v_close=true) and (trim(memo1.Text)<>'') and
//       (messagedlg('先前有数据被修改是否保存?',mtconfirmation,[mbyes,mbno],0)=mryes) then
//     button1click(sender);
//    self.Caption:='客户特别要求: ';
//    if button1.Enabled=true then button1.Enabled:=false;
//    if button2.Enabled=true then button2.Enabled:=false;
//    memo1.Text:='';
//    v_close:=false;
//    memo1.ReadOnly:=true;
//  end;
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker= smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    Ads10.IndexFieldNames:=Column.FieldName + ' DESC';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    Ads10.IndexFieldNames:=Column.FieldName;
  end;

  if (Column.Title.Caption<>preColumn.Title.Caption) and
     (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    Label1.Caption:=Column.Title.Caption;
    Edit1.Left := Label1.Width + Label1.Left +3;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    Edit1.SetFocus;
    Edit1.Text:='';
    preColumn:=Column;
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
  begin
    Ads10.Filtered:=False;
    Ads10.Filter:=preColumn.FieldName + ' like ''%' + Trim(Edit1.Text)+ '%''';
    Ads10.Filtered:=True;
  end
  else
  begin
    Ads10.Filter:='';
  end;
end;

end.

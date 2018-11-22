unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Grids, DBGrids, ComCtrls;

type
  TFrmMain = class(TForm)
    ADOConnection1: TADOConnection;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DataSource1: TDataSource;
    ADOData0010: TADOQuery;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Edit6: TEdit;
    BitBtn6: TBitBtn;
    Label10: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    ADOData0493: TADODataSet;
    ADO0116: TADODataSet;
    CheckBox1: TCheckBox;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADOItems0: TADOQuery;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker5: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    DateTimePicker6: TDateTimePicker;
    DateTimePicker7: TDateTimePicker;
    ADOData0493Company_Name: TStringField;
    ADOData0493Company_Name2: TStringField;
    ADOData0493Company_Name3: TStringField;
    ADOData0493ship_address: TStringField;
    ADOData0493Company_Icon: TBlobField;
    ADOData0493SITE_INFO_ADD_1: TStringField;
    ADOData0493SITE_INFO_ADD_2: TStringField;
    ADOData0493SITE_INFO_ADD_3: TStringField;
    ADOData0493SITE_INFO_PHONE: TStringField;
    ADOData0493printed_by_name: TStringField;
    ADOQuery1: TADOQuery;
    RadioGroup2: TRadioGroup;
    CheckBox2: TCheckBox;
    DateTimePicker4: TDateTimePicker;
    ADODetails: TADOStoredProc;
    ADODetailsinvoice_total: TBCDField;
    ADODetailsamount_credited: TBCDField;
    ADODetailsamt_paid: TBCDField;
    ADODetailsinvoice_date: TDateTimeField;
    ADOCusts: TADOStoredProc;
    ADOCustscustomer_ptr: TIntegerField;
    ADOCustscurrency_ptr: TIntegerField;
    ADOCustsopen_amt: TCurrencyField;
    ADOCustsamt_current: TCurrencyField;
    ADOCustsamt_paid: TCurrencyField;
    ADOCustsamt_credited: TCurrencyField;
    ADOCustsclose_amt: TCurrencyField;
    ADOCustsamt1: TCurrencyField;
    ADOCustsamt2: TCurrencyField;
    ADOCustsamt3: TCurrencyField;
    ADOCustsamt4: TCurrencyField;
    ADOCustsamt5: TCurrencyField;
    ADOCustsamt6: TCurrencyField;
    Adopaid: TADOStoredProc;
    ADOCredited: TADOStoredProc;
    Ado0112: TADOQuery;
    Ado0112ANALYSIS_CODE_1: TStringField;
    Ado0112CURR_CODE: TStringField;
    Ado0112EXCHANGE_RATE: TFloatField;
    Ado0112CUSTOMER_PTR: TIntegerField;
    Ado0112CURRENCY_PTR: TIntegerField;
    Ado0112invoice_number: TStringField;
    Ado0112INVOICE_DATE: TDateTimeField;
    Ado0112POSTED_DATE: TDateTimeField;
    Ado0112PRODUCT_NAME: TStringField;
    Ado0112INVOICE_TOTAL: TBCDField;
    Ado0112amount_paid: TBCDField;
    Ado0112amount_credited: TBCDField;
    Ado0112CASH_DISC: TBCDField;
    Ado0112amt_payable: TBCDField;
    Ado0112discount_days: TIntegerField;
    Ado0112discount_pct: TBCDField;
    Ado0112net_pay: TIntegerField;
    Ado0112delivery_no: TStringField;
    Ado0112PARTS_ORDERED: TFloatField;
    Ado0112MANU_PART_NUMBER: TStringField;
    Ado0112MANU_PART_DESC: TStringField;
    Ado0112unit_sq: TFloatField;
    Ado0112DATE_SHIPPED: TDateTimeField;
    Ado0112quan_shipped: TBCDField;
    Ado0112PO_NUMBER: TStringField;
    Ado0112part_price: TFloatField;
    Ado0112TAX_2: TBCDField;
    Ado0112amt_shipped: TFloatField;
    Ado0112tax_in_price: TStringField;
    Ado0112rkey: TIntegerField;
    Ado0112CUST_CODE: TStringField;
    Ado0112CUSTOMER_NAME: TStringField;
    Ado0112ABBR_NAME: TStringField;
    Ado0112CONTACT_NAME_1: TStringField;
    Ado0112CONT_PHONE_1: TStringField;
    Ado0112FAX: TStringField;
    Ado0112FED_TAX_ID_NO: TStringField;
    Ado0112FIN_DATE: TDateTimeField;
    Ado0112tot_accu_matl_per_sqft: TFloatField;
    Ado0112tot_accu_OVHD_per_sqft: TFloatField;
    Ado0112BILLING_ADDRESS_1: TStringField;
    Ado0112BILLING_ADDRESS_2: TStringField;
    Ado0112BILLING_ADDRESS_3: TStringField;
    Ado0112FOB: TStringField;
    Ado0112ANALYSIS_CODE_2: TStringField;
    Ado0112LAYERS: TWordField;
    Ado0112Detail_text: TStringField;
    ComboBox1: TComboBox;
    Ado0112SALES_ORDER: TStringField;
    Ado0112sttype: TStringField;
    procedure Edit6Exit(Sender: TObject);
    procedure BitBtn6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker6Exit(Sender: TObject);
    procedure DateTimePicker7Exit(Sender: TObject);
    procedure ADOData0493CalcFields(DataSet: TDataSet);
    procedure Ado0112CalcFields(DataSet: TDataSet);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses customersearch, Datail3,common;


{$R *.dfm}

procedure TFrmMain.Edit6Exit(Sender: TObject);
begin
    if edit6.Text ='' then exit;
    if FrmMain.ActiveControl =BitBtn6 then exit;
    Adodata0010.open;
    if Adodata0010.locate('CUST_CODE',trim(edit6.text),[]) then
    begin
      edit6.Text :=Adodata0010.FieldValues['CUST_CODE'];
      label10.Caption :=Adodata0010.FieldValues['CUSTOMER_NAME'];
    end else
    begin
      messagedlg('输入的客户代号不正确!',mtinformation,[mbok],0);
      edit6.SetFocus ;
    end;
end;

procedure TFrmMain.BitBtn6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    Adodata0010.open;
    FrmCustSearch.MaskEdit1.Text :='';
    FrmCustSearch.MaskEdit1.Text :=edit6.Text ;
    if FrmCustSearch.ShowModal=mrok then
    begin
      edit6.Text :=Adodata0010.FieldValues['CUST_CODE'];
      label10.Caption :=Adodata0010.FieldValues['CUSTOMER_NAME'];
    end;
    Adodata0010.Filter :='';
end;

procedure TFrmMain.BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    Adodata0010.open;
    FrmCustSearch.MaskEdit1.Text :='';
    FrmCustSearch.MaskEdit1.Text :=edit1.Text ;
    if FrmCustSearch.ShowModal=mrok then
    begin
      edit1.Text :=Adodata0010.FieldValues['CUST_CODE'];
      label4.Caption :=Adodata0010.FieldValues['CUSTOMER_NAME'];
    end;
    Adodata0010.Filter :='';
end;

procedure TFrmMain.Edit1Exit(Sender: TObject);
begin
    if edit1.Text ='' then exit;
    if FrmMain.ActiveControl =BitBtn1 then exit;
    Adodata0010.open;
    if Adodata0010.locate('CUST_CODE',trim(edit1.text),[]) then
    begin
      edit1.Text :=Adodata0010.FieldValues['CUST_CODE'];
      label4.Caption :=Adodata0010.FieldValues['CUSTOMER_NAME'];
    end else
    begin
      messagedlg('输入的客户代号不正确！',mtinformation,[mbok],0);
      edit1.SetFocus ;
    end;
end;

procedure TFrmMain.BitBtn3Click(Sender: TObject);

begin
    ADOData0493.Open;

    with AdoDetails do
    begin
      Close;
      parameters.ParamByName('@vindex').Value :=2;
    end;
    with AdoCusts do
    begin
      close;
      parameters.ParamByName('@vptr1').value := trim(edit6.Text);
      parameters.ParamByName('@vptr2').value := trim(edit1.Text);
      parameters.ParamByName('@vdate1').value:=strtodate(datetostr(Datetimepicker4.Date))+1;
      parameters.ParamByName('@vdate2').value:=strtodate(datetostr(Datetimepicker5.Date));
      parameters.ParamByName('@vptr1_1').value:=trim(edit6.Text);
      parameters.ParamByName('@vptr2_1').value:=trim(edit1.Text);
      parameters.ParamByName('@vdate1_1').value:=strtodate(datetostr(Datetimepicker4.Date))+1;
      parameters.ParamByName('@vdate2_1').value:=strtodate(datetostr(Datetimepicker5.Date));
      open;
    end;
     with Ado0112 do
      begin
        close;
        sql.Delete(35);
        sql.Insert(35,'and data0010.cust_code>='+quotedstr(edit6.Text));
        sql.Delete(36);
        sql.Insert(36,'and data0010.cust_code<='+quotedstr(edit1.Text));
        sql.Delete(73);
        sql.Insert(73,'and data0010.cust_code>='+quotedstr(edit6.Text));
        sql.Delete(74);
        sql.Insert(74,'and data0010.cust_code<='+quotedstr(edit1.Text));
        sql.Delete(115);
        sql.Insert(115,'and data0010.cust_code>='+quotedstr(edit6.Text));
        sql.Delete(116);
        sql.Insert(116,'and data0010.cust_code<='+quotedstr(edit1.Text));
        if combobox1.ItemIndex=0 then
        begin
        sql.Delete(37);
        sql.Insert(37,'and data0112.POSTED_DATE>='+
                           quotedstr(formatdatetime('yyyy-mm-dd',datetimepicker6.Date)));
        sql.Delete(38);
        sql.Insert(38,'and data0112.POSTED_DATE<='+
                           quotedstr(formatdatetime('yyyy-mm-dd',datetimepicker7.Date)));
        sql.Delete(75);
        sql.Insert(75,'and data0112.POSTED_DATE>='+
                           quotedstr(formatdatetime('yyyy-mm-dd',datetimepicker6.Date)));
        sql.Delete(76);
        sql.Insert(76,'and data0112.POSTED_DATE<='+
                           quotedstr(formatdatetime('yyyy-mm-dd',datetimepicker7.Date)));
        sql.Delete(117);
        sql.Insert(117,'and data0116.MEMO_DATE>='+
                           quotedstr(formatdatetime('yyyy-mm-dd',datetimepicker6.Date)));
        sql.Delete(118);
        sql.Insert(118,'and data0116.MEMO_DATE<='+
                           quotedstr(formatdatetime('yyyy-mm-dd',datetimepicker7.Date)));
        end
        else
        begin
        sql.Delete(37);
        sql.Insert(37,'and data0112.invoice_date>='+
                      quotedstr(formatdatetime('yyyy-mm-dd',datetimepicker6.Date)));
        sql.Delete(38);
        sql.Insert(38,'and data0112.invoice_date<='+
                      quotedstr(formatdatetime('yyyy-mm-dd',datetimepicker7.Date)));
        sql.Delete(75);
        sql.Insert(75,'and data0112.invoice_date>='+
                      quotedstr(formatdatetime('yyyy-mm-dd',datetimepicker6.Date)));
        sql.Delete(76);
        sql.Insert(76,'and data0112.invoice_date<='+
                      quotedstr(formatdatetime('yyyy-mm-dd',datetimepicker7.Date)));
        sql.Delete(117);
        sql.Insert(117,'and data0116.RMA_DATE>='+
                           quotedstr(formatdatetime('yyyy-mm-dd',datetimepicker6.Date)));
        sql.Delete(118);
        sql.Insert(118,'and data0116.RMA_DATE<='+
                           quotedstr(formatdatetime('yyyy-mm-dd',datetimepicker7.Date)));
        end;
        sql.Delete(119);
        if radiogroup2.ItemIndex=0 then
         sql.Add('order by data0010.cust_code,data0112.currency_ptr,data0097.po_number')
        else
         sql.Add('order by data0010.cust_code,data0112.currency_ptr,data0064.date_shipped');

        open;
      end;
    Ado0116.Open ;

   Application.CreateForm(TFrmDetail3, FrmDetail3);
    FrmDetail3.showmodal;
    FrmDetail3.free;
    Ado0112.Close;
 
end;

procedure TFrmMain.FormCreate(Sender: TObject);

begin
 if not app_init(self.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
 self.Caption:=application.Title;

//user_ptr:='1';
end;

procedure TFrmMain.FormShow(Sender: TObject);
var
  Present: TDateTime;
  Year, Month, Day: Word;
begin

  Present:= common.getsystem_date(self.ADOQuery1,1);
  DecodeDate(Present, Year, Month, Day);
  Datetimepicker5.Date :=Present-day;

  Present:=Datetimepicker5.Date;
  DecodeDate(Present, Year, Month, Day);
  Datetimepicker4.Date :=Present-day;
  
  Present:=Datetimepicker4.Date;
  DecodeDate(Present, Year, Month, Day);
  Datetimepicker3.Date :=Present-day;
  Present:=Datetimepicker3.Date;
  DecodeDate(Present, Year, Month, Day);
  Datetimepicker2.Date :=Present-day;
  Present:=Datetimepicker2.Date;
  DecodeDate(Present, Year, Month, Day);
  Datetimepicker1.Date :=Present-day;

  Adodata0010.open;
  edit6.Text := Adodata0010.FieldValues['CUST_CODE'];
  label10.Caption := Adodata0010.FieldValues['CUSTOMER_NAME'];
  Adodata0010.Last;
  edit1.Text := Adodata0010.FieldValues['CUST_CODE'];
  label4.Caption := Adodata0010.FieldValues['CUSTOMER_NAME'];
  Datetimepicker6.Date := Datetimepicker4.Date+1;
  Datetimepicker7.Date := Datetimepicker5.Date;

end;

procedure TFrmMain.DateTimePicker6Exit(Sender: TObject);
var
  Present: TDateTime;
  Year, Month, Day: Word;
begin
  Datetimepicker4.Date :=Datetimepicker6.Date-1;
  Present:=Datetimepicker6.Date-1;
  
  DecodeDate(Present, Year, Month, Day);
  Datetimepicker3.Date :=Present-day;

  Present:=Datetimepicker3.Date;
  DecodeDate(Present, Year, Month, Day);


  Datetimepicker2.Date :=Present-day;
  Present:=Datetimepicker2.Date;

  DecodeDate(Present, Year, Month, Day);
  Datetimepicker1.Date :=Present-day;
end;

procedure TFrmMain.DateTimePicker7Exit(Sender: TObject);
begin
  Datetimepicker5.Date :=Datetimepicker7.Date;
end;

procedure TFrmMain.ADOData0493CalcFields(DataSet: TDataSet);
begin
  with adoquery1 do
  begin
    close;
    sql.Clear ;
    sql.Add('select employee_name from data0005 where rkey='+user_ptr);
    open;
  end;
  Adodata0493.FieldByName('printed_by_name').AsString :=Adoquery1.fieldbyname('employee_name').AsString;
end;

procedure TFrmMain.Ado0112CalcFields(DataSet: TDataSet);
begin
  IF Ado0112.FieldByName('RKEY').asfloat=0 then exit;
  with AdoItems0 do
  begin
    close;
    parameters.ParamByName('rkey').Value := Ado0112.FieldByName('rkey').asinteger;
    open;
  end;
  if not AdoItems0.IsEmpty then
  begin
    AdoItems0.First;
    with AdoItems0 do
    while not eof do
    begin
      Ado0112.FieldByName('Detail_text').AsString:=
       trim(Ado0112.FieldByName('Detail_text').AsString)
       + ' '+ AdoItems0.FieldByName('category').AsString+':'+AdoItems0.FieldByName('amount').AsString;
      next;
    end;
  end;
end;

end.

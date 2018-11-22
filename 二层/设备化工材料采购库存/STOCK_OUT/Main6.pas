unit Main6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB, ADODB, Menus,
  Mask, DBCtrls, ComCtrls,DateUtils;

type
  TFrmMain6 = class(TForm)
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    ADOData0457: TADOQuery;
    DataSource1: TDataSource;
    ADOData0457TStatus: TStringField;
    StatusBar1: TStatusBar;
    ADOData0005: TADOQuery;
    AutoIncField1: TAutoIncField;
    StringField3: TStringField;
    Label1: TLabel;
    Label3: TLabel;
    ADOData0457auditor: TStringField;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ADOData0457cTYpe: TStringField;
    ADODate: TADOQuery;
    user_ptr: TLabel;
    RadioGroup1: TRadioGroup;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    ADOData0457RKEY: TAutoIncField;
    ADOData0457GON_NUMBER: TStringField;
    ADOData0457TTYPE: TSmallintField;
    ADOData0457CREATE_DATE: TDateTimeField;
    ADOData0457CREATE_BY: TIntegerField;
    ADOData0457STATUS: TSmallintField;
    ADOData0457AUDITED_BY: TIntegerField;
    ADOData0457AUDITED_DATE: TDateTimeField;
    ADOData0457REF_NUMBER: TStringField;
    ADOData0457employee_name: TStringField;
    tmpADO2: TADOQuery;
    ADOData0457RECD_BY: TIntegerField;
    procedure ADOData0457CalcFields(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure DateTimePicker2CloseUp(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
  private
    vindex:integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain6: TFrmMain6;

implementation

uses Mainmenu, Report6, Report5;
{$R *.dfm}

procedure TFrmMain6.ADOData0457CalcFields(DataSet: TDataSet);
begin
  case Adodata0457.fieldbyname('status').asinteger of
  0: Adodata0457.fieldbyname('tstatus').asstring:='待审计';
  1: Adodata0457.fieldbyname('tstatus').asstring:='已审计';
  end;
  case Adodata0457.fieldbyname('ttype').asinteger of
  1: Adodata0457.fieldbyname('ctype').asstring:='到配料单';
  2: Adodata0457.fieldbyname('ctype').asstring:='到部门';
  3: Adodata0457.fieldbyname('ctype').asstring:='到车间库存';
  4: Adodata0457.fieldbyname('ctype').asstring:='退回货仓';
  end;
end;

procedure TFrmMain6.N1Click(Sender: TObject);
begin
  with tmpAdo2 do
    begin
      close;
      parameters.ParamByName('vptr').Value :=Adodata0457.fieldbyname('recd_by').asinteger;
      open;
    end;
  case  Adodata0457.fieldbyname('ttype').asinteger of
  1:begin
      Application.CreateForm(TFrmReport5, FrmReport5);
      with FrmReport5.Ado1 do
      begin
        close;
        parameters.ParamByName('vptr').Value :=Adodata0457.fieldbyname('rkey').asinteger;
        open;
      end;
      FrmReport5.ADOData0493.Open ;
      FrmReport5.ppLabel24.Caption :=Adodata0457.fieldbyname('gon_number').asstring;
      FrmReport5.ppLabel11.Caption:=Adodata0457.fieldbyname('ref_number').asstring;
      FrmReport5.ppLabel10.Caption :=Adodata0457.fieldbyname('employee_name').asstring;
      FrmReport5.ppLabel23.Caption :=tmpAdo2.fieldbyname('employee_name').AsString;
      FrmReport5.ppReport1.Print;
      FrmReport5.Free ;
    end;
  2,3,4:begin
      Application.CreateForm(TFrmReport6, FrmReport6);
      with FrmReport6.Ado1 do
      begin
        close;
        parameters.ParamByName('vptr').Value :=Adodata0457.fieldbyname('rkey').asinteger;
        open;
      end;
      FrmReport6.ADOData0493.Open ;
      FrmReport6.ppLabel24.Caption :=Adodata0457.fieldbyname('gon_number').asstring;
      FrmReport6.ppLabel11.Caption:=Adodata0457.fieldbyname('ref_number').asstring;
      FrmReport6.ppLabel10.Caption :=Adodata0457.fieldbyname('employee_name').asstring;
      FrmReport6.ppLabel23.Caption :=tmpAdo2.fieldbyname('employee_name').AsString;
      FrmReport6.ppReport1.Print;
      FrmReport6.Free ;
    end;
  end;
end;

procedure TFrmMain6.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMain6.FormShow(Sender: TObject);
begin
  vindex:=0;;
  user_ptr.Caption :='125';
  Datetimepicker1.Date :=now-dayof(now);
  Datetimepicker2.Date :=now;
  with Adodata0457 do
  begin
    close;
    sql.Clear;
    sql.Add('select data0457.*,data0005.employee_name');
    sql.Add('from data0457,data0005');
    sql.Add('where data0457.create_by=data0005.rkey');
    sql.Add('and create_date>='''+datetostr(datetimepicker1.Date)+'''');
    sql.Add('and create_date<'''+datetostr(datetimepicker2.Date+1)+'''');
    sql.Add('and status=0');
    sql.Add('order by gon_number');
    prepared;
    open;
  end;
end;

procedure TFrmMain6.RadioGroup1Click(Sender: TObject);
begin
  if Radiogroup1.ItemIndex <>vindex then
  begin
    with Adodata0457 do
    begin
      close;
      sql.Clear;
      sql.Add('select data0457.*,data0005.employee_name');
      sql.Add('from data0457,data0005');
      sql.Add('where data0457.create_by=data0005.rkey');
      sql.Add('and create_date>='''+datetostr(datetimepicker1.Date)+'''');
      sql.Add('and create_date<'''+datetostr(datetimepicker2.Date+1)+'''');
      if Radiogroup1.ItemIndex=0 then
        sql.Add('and status=0');
      if Radiogroup1.ItemIndex=1 then
        sql.Add('and status=1');
      sql.Add('order by gon_number');
      prepared;
      open;
    end;
    vindex:=radiogroup1.ItemIndex ;
  end;
end;

procedure TFrmMain6.DateTimePicker1CloseUp(Sender: TObject);
begin
  Datetimepicker2.SetFocus ;
end;

procedure TFrmMain6.DateTimePicker2CloseUp(Sender: TObject);
begin
  vindex:=3;
  RadioGroup1Click(sender);
end;

procedure TFrmMain6.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then dbgrid1.SetFocus ;
end;

procedure TFrmMain6.Edit1Exit(Sender: TObject);
begin
  if not Adodata0457.Locate('gon_number',trim(edit1.text),[]) then
    messagedlg('当前状态中没找到该收货单！',mtinformation,[mbok],0);
end;

procedure TFrmMain6.FormCreate(Sender: TObject);
begin
  Adodate.Open ;
  Adodata0005.Open ;
end;

procedure TFrmMain6.DateTimePicker2Exit(Sender: TObject);
begin
  DateTimePicker2CloseUp(Sender);
end;

end.

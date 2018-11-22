unit ComplainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, Menus, ExtCtrls ,PubFunc ,shellAPI;

type
  TFrm_Complain = class(TForm)
    DBGridEh1: TDBGridEh;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    ADODataSet1RKEY: TIntegerField;
    ADODataSet1LOG_NUMBER: TStringField;
    ADODataSet1CUSTOMER_PART_PTR: TIntegerField;
    ADODataSet1CSI_USER_PTR: TIntegerField;
    ADODataSet1CUSTOMER_PTR: TIntegerField;
    ADODataSet1LOG_DATE: TDateTimeField;
    ADODataSet1SHIP_DATE: TDateTimeField;
    ADODataSet1QTY: TFloatField;
    ADODataSet1EFFECT_TP: TStringField;
    ADODataSet1ANALYSIS: TStringField;
    ADODataSet1AFTER_ACTION: TStringField;
    ADODataSet1STATUS: TSmallintField;
    ADODataSet1CLOSED_BY_PTR: TIntegerField;
    ADODataSet1CLOSED_DATE: TDateTimeField;
    ADODataSet1DEALT_BY_PTR: TIntegerField;
    ADODataSet1DEALT_DATE: TDateTimeField;
    ADODataSet1LOSS_AMT: TIntegerField;
    ADODataSet1RESULT: TStringField;
    ADODataSet1CONTENT: TStringField;
    ADODataSet1DEFECT_MAIN: TWideStringField;
    ADODataSet1CYCLES: TWideStringField;
    ADODataSet1UNIT_PTR: TIntegerField;
    ADODataSet1if_send: TBooleanField;
    ADODataSet1CUST_CODE: TStringField;
    ADODataSet1CUSTOMER_NAME: TStringField;
    ADODataSet1Ssend: TStringField;
    ADODataSet1Close_EMPLOYEE_NAME: TStringField;
    ADODataSet1MANU_PART_NUMBER: TStringField;
    ADODataSet1MANU_PART_DESC: TStringField;
    ADODataSet1Dealt_EMPLOYEE_NAME: TStringField;
    ADODataSet1Ent_EMPLOYEE_NAME: TStringField;
    ADODataSet1Unit_Name: TStringField;
    ADODataSet1dept_names: TMemoField;
    ADODataSet1Tstatus: TStringField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DBGridEh2: TDBGridEh;
    Splitter1: TSplitter;
    ADO148: TADOQuery;
    ADO148rkey: TAutoIncField;
    ADO148rec_no: TIntegerField;
    ADO148SOURCE_PTR: TIntegerField;
    ADO148file_name: TStringField;
    ADO148in_date: TDateTimeField;
    ADO148remark: TStringField;
    DataSource2: TDataSource;
    temp: TADOQuery;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ADODataSet1AfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    file_name:Tstringlist;
  end;

var
  Frm_Complain: TFrm_Complain;
const
 TmpFileDir = 'c:\tmp\';

implementation

uses main, FielsFrm;

{$R *.dfm}

procedure TFrm_Complain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (ssAlt in Shift)  and  (Key=86) then
  ShowMessage(ADODataSet1.CommandText);
end;

procedure TFrm_Complain.N1Click(Sender: TObject);
var
 filename,f:string;
 fs: TMemoryStream;
begin

  if copy(file_name.Strings[ado148rec_no.value],
        pos(';',file_name.Strings[ADO148rec_no.value])+1,1)='1' then
  begin
    temp.Close;
    temp.SQL.Text:='select vcut_bmp FROM Data0148 where rkey='+ADO148rkey.AsString;
    temp.Open;
    if temp.fieldbyname('vcut_bmp').IsNull then
    begin
      showmessage('此文档为空...');
      exit;
    end;
    fs := TMemoryStream.Create;
    TBlobfield(temp.fieldbyname('vcut_bmp')).SaveToStream(fs);
    UnPackStream(fs);
    if not DirectoryExists(TmpFileDir) then
      if not CreateDir(TmpFileDir) then
        raise Exception.Create('创建临时文件目录错误: '+TmpFileDir);
    f:=TmpFileDir+ado148file_name.AsString;
    fs.SaveToFile(f);
    fs.Free;
    ShellExecute(self.Handle,nil,pchar(f),nil,nil,SW_SHOWNORMAL);
  end
  else
   begin
    filename:= copy(file_name.Strings[ADO148rec_no.value],1,
                     pos(';',file_name.Strings[ADO148rec_no.value])-1);
    ShellExecute(self.Handle,nil,pchar(filename),nil,nil,SW_SHOWNORMAL);
   end;
//  Frm_FIels := TFrm_FIels.Create(Self);
//  Frm_FIels.ADO148.Close;
//  Frm_FIels.ADO148.Parameters[0].Value := ADODataSet1RKEY.AsInteger;
//  Frm_FIels.ADO148.Open;
//  while not Frm_FIels.ADO148.Eof do
//  begin
//   Frm_FIels.file_name.Add(Frm_FIels.ADO148file_name.Value+';'+'1');
//   Frm_FIels.ADO148.Next;
//  end;
//  Frm_FIels.ADO148.First;
//  if Frm_FIels.ShowModal = mrok then

end;

procedure TFrm_Complain.FormShow(Sender: TObject);
begin

  ADO148.Close;
  ADO148.Parameters[0].Value := ADODataSet1RKEY.AsInteger;
  ADO148.Open;

  while not ADO148.Eof do
  begin
   file_name.Add(ADO148file_name.Value+';'+'1');
   ADO148.Next;
  end;
  ADO148.First;

end;

procedure TFrm_Complain.ADODataSet1AfterScroll(DataSet: TDataSet);
begin

  ADO148.Close;
  ADO148.Parameters[0].Value := ADODataSet1RKEY.AsInteger;
  ADO148.Open;

  while not ADO148.Eof do
  begin
   file_name.Add(ADO148file_name.Value+';'+'1');
   ADO148.Next;
  end;
  
  ADO148.First;
end;

procedure TFrm_Complain.FormCreate(Sender: TObject);
begin
  file_name:=tstringlist.Create;
end;

end.

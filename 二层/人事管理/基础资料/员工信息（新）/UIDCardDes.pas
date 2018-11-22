unit UIDCardDes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB, ADODB,common;

type
  TFrmIDcardDes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnExit: TBitBtn;
    btnExcel: TBitBtn;
    lbl1: TLabel;
    edt_value: TEdit;
    qry_Main: TADOQuery;
    ds_Main: TDataSource;
    dbgrdhDetail: TDBGridEh;
    qry_Mainemployeecode: TWideStringField;
    qry_MainchineseName: TWideStringField;
    qry_MaindepartmentName: TWideStringField;
    qry_Mainondutytime: TDateTimeField;
    qry_Mainidcardtime: TDateTimeField;
    procedure dbgrdhDetailTitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure edt_valueChange(Sender: TObject);
    procedure edt_valueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }

     field_name  :string;
       PreColumn: TColumnEh;

  public
    { Public declarations }
  end;

var
  FrmIDcardDes: TFrmIDcardDes;

implementation
          uses udm;
{$R *.dfm}

procedure TFrmIDcardDes.dbgrdhDetailTitleClick(Column: TColumnEh);
begin

if dbgrdhDetail.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;

 if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_main.Sort:=Column.FieldName;
    column.Title.Color:=clred;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_Main.Sort:= Column.FieldName + ' DESC';
     column.Title.Color:=clred;
  end;

  if dbgrdhDetail.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (PreColumn.FieldName<>column.FieldName)  then    //and (column.ReadOnly)
  begin
    lbl1.Caption:=column.Title.Caption + ':';
    self.field_name:=column.FieldName;
    edt_value.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
    edt_value.SetFocus;
end;

procedure TFrmIDcardDes.FormShow(Sender: TObject);
begin
 field_name:=  self.dbgrdhDetail.Columns[0].FieldName;
 PreColumn:=self.dbgrdhDetail.Columns[0];



end;

procedure TFrmIDcardDes.btnExcelClick(Sender: TObject);
begin
  if ((strtoint(vprev)<>2) and  (strtoint(vprev)<>4) ) then
    begin
    showmessage('没有权限！！');
    exit;
    end;
    if  qry_main.RecordCount<1  then exit;
      Export_dbGridEH_to_Excel(dbgrdhDetail,'身份证快过期员工信息');
end;

procedure TFrmIDcardDes.edt_valueChange(Sender: TObject);
var
   ssql: string;
begin
 if trim(edt_value.text)='' then
   begin
    if  qry_Main.filtered=true  then
    begin
     qry_main.filtered:=false;
     //lblMCount.Caption := inttostr(FrmMain.qry_EMP.recordcount);
     exit;
     end;
    end;

   if qry_main.FieldByName(field_name).datatype in [ftString,ftWideString] then
   ssql:= '  '+field_name+'  like   ''%'+trim(edt_value.text)+'%''  '
    else if qry_main.FieldByName(field_name).DataType in [ftinteger,ftsmallint, ftDateTime,ftfloat]  then
   ssql:= '  '+field_name+' = '''+trim(edt_value.text)+'''  '
    else
    ssql:='';
   with qry_main do
   begin
     filtered:= false;
     filter:= ssql;
     filtered:=true;
   end;


end;

procedure TFrmIDcardDes.edt_valueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key<>13  then
  exit
  else
  begin

   if trim(edt_value.text)='' then
   begin
    if  qry_main.filtered=true  then
    begin
     qry_main.filtered:=false;
     //lblMCount.Caption := inttostr(FrmMain.qry_EMP.recordcount);
     exit;
     end;
    end;

  edt_valueChange(sender);
  end;

end;

procedure TFrmIDcardDes.btnExitClick(Sender: TObject);
begin
close;
end;

end.

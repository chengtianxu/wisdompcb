unit UFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls,ConstVar;

type
  TFrmMain = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    lbl_field: TLabel;
    edt_value: TEdit;
    btn_export: TBitBtn;
    btn_qry: TBitBtn;
    btn_exit: TBitBtn;
    dbgrdh1: TDBGridEh;
    qry1: TADOQuery;
    ds1: TDataSource;
    lbl1: TLabel;
    strngfldqry1DSDesigner: TStringField;
    strngfldqry1DSDesigner2: TStringField;
    intgrfldqry1DSDesigner3: TIntegerField;
    fltfldqry1DSDesigner4: TFloatField;
    intgrfldqry1DSDesigner24: TIntegerField;
    fltfldqry1DSDesigner242: TFloatField;
    intgrfldqry1DSDesigner12: TIntegerField;
    fltfldqry1DSDesigner122: TFloatField;
    intgrfldqry1DSDesigner35: TIntegerField;
    fltfldqry1DSDesigner352: TFloatField;
    intgrfldqry1DSDesigner610: TIntegerField;
    fltfldqry1DSDesigner6102: TFloatField;
    intgrfldqry1DSDesigner1120: TIntegerField;
    fltfldqry1DSDesigner11202: TFloatField;
    intgrfldqry1DSDesigner2030: TIntegerField;
    fltfldqry1DSDesigner20302: TFloatField;
    intgrfldqry1DSDesigner30: TIntegerField;
    fltfldqry1DSDesigner302: TFloatField;
    procedure dbgrdh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure edt_valueChange(Sender: TObject);
    procedure btn_exitClick(Sender: TObject);
    procedure btn_exportClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_qryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    PreColumn :TColumnEh;
    field_name: string;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation
         uses  UDM,common, UQry;

{$R *.dfm}

procedure TFrmMain.dbgrdh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(self.qry1.sql.text);
end;

procedure TFrmMain.dbgrdh1TitleClick(Column: TColumnEh);
begin
 //if (column.ReadOnly)  then
  if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   qry1.sort:=Column.FieldName;
  end
  else begin
   column.Title.SortMarker:=smDownEh;
   qry1.sort:=Column.FieldName+' DESC';
  end;
  
  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString])   then
  begin
    lbl_field.Caption:=column.Title.Caption;
    edt_value.SetFocus;
    Field_Name:= column.fieldName;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edt_value.SetFocus;
end;

procedure TFrmMain.edt_valueChange(Sender: TObject);
var
  a :string;
Begin
if qry1.Active then
 if trim(edt_value.text)<>'' then
   qry1.Filter := Field_Name+' like ''%'+trim(edt_value.text)+'%'''
 else qry1.filter := '';
 a:='test';
end;

procedure TFrmMain.btn_exitClick(Sender: TObject);
begin
close;
end;

procedure TFrmMain.btn_exportClick(Sender: TObject);
begin

 Export_dbGridEH_to_Excel(dbgrdh1,self.Caption);
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
Field_name:=dbgrdh1.columns[0].fieldname;
precolumn:=dbgrdh1.columns[0];
end;

procedure TFrmMain.btn_qryClick(Sender: TObject);
var
 i:integer;
 ssql:string;
begin
  try
 frmqry:=Tfrmqry.create(nil);

  if frmqry.ShowModal=mrok then
 begin

  for i:=1 to frmqry.SGrid1.RowCount-2 do
   ssql:=ssql+ frmqry.SGrid1.Cells[2,i]+#13;
 
    qry1.Close;
    qry1.sql.Clear;
    qry1.SQL.Add('exec sp_ProcessTimeQry  '''+ssql+''' ');

   if ssql='' then
   begin
    qry1.Close;
    qry1.sql.Clear;
    qry1.sql.add('exec sp_ProcessTimeQry '''' ' );
    end;

       // ShowMessage(qry1.sql.Text);

     qry1.open;



 end;
 finally
   frmqry.free;
 end;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
       
//   rkey73:='72';
//   user_ptr:='3';
//   vprev:='4';

 if not App_Init_2(dm.con1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！', '提示', 1);
    application.Terminate;
  end;


  self.Caption := Application.Title;

  end;

end.

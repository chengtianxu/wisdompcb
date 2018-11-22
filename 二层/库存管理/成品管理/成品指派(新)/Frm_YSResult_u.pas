unit Frm_YSResult_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TFrm_YSResult = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1PO_NUMBER: TStringField;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1DSDesigner: TFloatField;
    ADOQuery1DSDesigner2: TIntegerField;
    ADOQuery1DSDesigner3: TFloatField;
    ADOQuery1DSDesigner4: TFloatField;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    precolumn:Tcolumneh;
  public
    { Public declarations }
  end;

var
  Frm_YSResult: TFrm_YSResult;

implementation
uses damo,common;
{$R *.dfm}

procedure TFrm_YSResult.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
   showmessage(ADOQuery1.SQL.Text);
end;

procedure TFrm_YSResult.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker=smupeh then
  begin
    column.Title.SortMarker:=smdowneh;
    ADOQuery1.Sort:=column.FieldName+' DESC';
  end
  else begin
    column.Title.SortMarker:=smupeh;
    ADOQuery1.Sort:=column.FieldName;
  end;
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftInteger,ftFloat,ftDate, ftTime, ftDateTime] then exit;
  if (column.ReadOnly) and (precolumn.FieldName<>column.FieldName) then
  begin
    label1.Caption:=column.Title.Caption;
    precolumn.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    precolumn:=column;
    edit1.Text:='';
  end;
  edit1.SetFocus;
end;

procedure TFrm_YSResult.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
    ADOQuery1.Filter:=precolumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else ADOQuery1.Filter:='';
end;

procedure TFrm_YSResult.FormCreate(Sender: TObject);
begin
  precolumn:=DBGridEh1.Columns[0];
end;

procedure TFrm_YSResult.BitBtn2Click(Sender: TObject);
begin
 if not ADOQuery1.IsEmpty then
  export_dbgrideh_to_excel(DBGridEh1,'货款预收状况--数据导出');
end;

end.

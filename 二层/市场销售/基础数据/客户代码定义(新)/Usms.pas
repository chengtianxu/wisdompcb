unit Usms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, ExtCtrls, Buttons, DB;

type
  TSMS_Frm = class(TForm)
    Grd1: TDBGridEh;
    Panel1: TPanel;
    Label4: TLabel;
    Edit4: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit4Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Grd1DblClick(Sender: TObject);
  private
    FGrd:TStringGrid;
    PreColumn: TColumnEh;
    field_name:string;
    Ftp:integer;
    { Private declarations }
  public
    class function InitEdt(Grd:TStringGrid;tp:integer):boolean;
    { Public declarations }
  end;

var
  SMS_Frm: TSMS_Frm;

implementation

uses damo,common;

{$R *.dfm}

class function TSMS_Frm.InitEdt(Grd:TStringGrid;tp:integer): boolean;
var i:integer;
    s:string;
begin
  
  with TSMS_Frm.Create(nil) do
  begin
    s:='';
    for i:=1 to Grd.RowCount-2 do
      s:=s+Grd.Cells[3,i]+',';
    s:=s+'0';
    DM.ADO73.Filter:='';
    DM.ADO73.Close;
    DM.ADO73.SQL.Text:='SELECT  dbo.Data0073.RKEY, dbo.Data0005.TPOSTION, dbo.Data0073.USER_LOGIN_NAME, dbo.Data0073.USER_FULL_NAME '+
                       'FROM   Data0073 INNER JOIN '+
                       '       Data0005 ON Data0073.EMPLOYEE_PTR = Data0005.RKEY AND Data0073.EMPLOYEE_PTR = Data0005.RKEY '+
                       ' WHERE NOT Data0073.RKEY in ('+s+') '+
                       'ORDER BY Data0073.USER_LOGIN_NAME ';

    DM.ADO73.Open;
    if DM.ADO73.IsEmpty then
    begin
      showmessage('当前没有可用操作员...');
      result:=false;
      free;
    end else begin
      field_name:='USER_LOGIN_NAME';
      PreColumn := Grd1.Columns[0] ;
      PreColumn.Title.Color := clred ;
      FGrd:=Grd;
      Ftp:=tp;
      showmodal;
      DM.ADO73.Close;
    end;
  end;
end;
     
procedure TSMS_Frm.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker=smNoneEh) or (column.Title.SortMarker =smDownEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO73.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO73.Sort:=Column.FieldName+' DESC';
  end;
  if field_name <> column.FieldName then
  begin
    if not (Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftTime, ftDateTime]) then
      label4.Caption := '搜索: ' + column.Title.Caption ;
    field_name := column.FieldName ;
    edit4.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit4Change(Edit4);
  end else
    edit4.SetFocus;
end;

procedure TSMS_Frm.Edit4Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit4.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit4.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit4.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TSMS_Frm.FormShow(Sender: TObject);
begin
     Grd1TitleClick(PreColumn);
end;

procedure TSMS_Frm.BitBtn1Click(Sender: TObject);
begin
    if FGrd.RowCount = 2 then
    begin
          Self.Grd1DblClick(Sender);
          self.close;
    end else if  FGrd.RowCount > 2  then   self.close;

end;

procedure TSMS_Frm.Grd1DblClick(Sender: TObject);
var i:integer;
begin
      try
    if Ftp=0 then
      begin
        if FGrd.RowCount = 2 then i:=1
        else i:=FGrd.RowCount-1;
      end
    else
      i:=Fgrd.row;
    FGrd.Cells[0,i]:=DM.ADO73.Fieldbyname('USER_LOGIN_NAME').AsString;
    FGrd.Cells[1,i]:=DM.ADO73.Fieldbyname('USER_FULL_NAME').AsString;
    FGrd.Cells[2,i]:=DM.ADO73.Fieldbyname('TPOSTION').AsString;
    FGrd.Cells[3,i]:=DM.ADO73.fieldbyname('rkey').AsString;
    if Ftp=0 then FGrd.RowCount:=FGrd.RowCount+1;
    DM.ADO73.Delete;
  finally
    if DM.ADO73.IsEmpty then self.close;
  end;
end;

end.

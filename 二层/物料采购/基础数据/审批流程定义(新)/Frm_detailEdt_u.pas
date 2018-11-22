unit Frm_detailEdt_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls;

type
  TFrm_detailEdt = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Grd1: TDBGridEh;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FGrd:TStringGrid;
    PreColumn: TColumnEh;
    field_name:string;
    Fdept:integer;
    Ftp:integer;
  public
    class function InitEdt(iDept:integer;Grd:TStringGrid;tp:integer):boolean;
  end;

var
  Frm_detailEdt: TFrm_detailEdt;

implementation
 uses DM_u,Frm_Out_u;
{$R *.dfm}

class function TFrm_detailEdt.InitEdt(iDept:integer;Grd:TStringGrid;tp:integer): boolean;
var i:integer;
    s:string;
begin
  with TFrm_detailEdt.Create(nil) do
  begin
    s:='';
    for i:=1 to Grd.RowCount-2 do
      s:=s+Grd.Cells[4,i]+',';
    s:=s+'0';
    DM.ADO73.Filter:='';
    DM.ADO73.Close;
    DM.ADO73.SQL.Text:='select rkey,USER_LOGIN_NAME as user_id,user_full_name from data0073 '+
                       'where user_group_flag=1 and active_flag=0 and not RKEY in ('+s+') '+
                       'order by  USER_LOGIN_NAME';

    DM.ADO73.Open;
    if DM.ADO73.IsEmpty then
    begin
      showmessage('当前没有可用操作员...');
      result:=false;
      free;
    end else begin
      field_name:='location_code';
      PreColumn := Grd1.Columns[0] ;
      PreColumn.Title.Color := clred ;
      FGrd:=Grd;
      Ftp:=tp;
      showmodal;
      free;
      DM.ADO73.Close;
    end;
  end;
end;

procedure TFrm_detailEdt.BitBtn1Click(Sender: TObject);
var i,iUSER_PTR:integer;

begin
  with TFrm_out.Create(nil) do
  try
    Edit1.Text:=DM.ADO73.Fieldbyname('user_id').AsString;
    Edit2.Text:=DM.ADO73.Fieldbyname('user_full_name').AsString;

    if showmodal=mrok then
    begin
      if Ftp=0 then
        i:=FGrd.RowCount-1
      else begin
        i:=Fgrd.row;
        iUSER_PTR:=strtoint(FGrd.Cells[4,i]);
      end;
      FGrd.Cells[0,i]:=Edit1.Text;
      FGrd.Cells[1,i]:=Edit2.Text;

      FGrd.Cells[2,i]:=Edit5.Text;
      FGrd.Cells[3,i]:=Edit6.Text;

      FGrd.Cells[4,i]:=DM.ADO73.Fieldbyname('rkey').AsString;
      if Ftp=0 then
      begin
        FGrd.RowCount:=FGrd.RowCount+1;
        DM.ADO275_1.Append;
      end else begin
        if DM.ADO275_1.Locate('USER_PTR',iUSER_PTR,[]) then
          DM.ADO275_1.Edit;
      end;
      DM.ADO275_1.FieldByName('USER_PTR').AsString:=FGrd.Cells[4,i];
      DM.ADO275_1.FieldByName('LOWER_LIMIT').AsString:=Edit5.Text;
      DM.ADO275_1.FieldByName('UPPER_LIMIT').AsString:=Edit6.Text;

      DM.ADO275_1.Post;

      DM.ADO73.Delete;
    end;
  finally
    free;
    if DM.ADO73.IsEmpty then self.close;
  end;

end;

procedure TFrm_detailEdt.Grd1TitleClick(Column: TColumnEh);
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
      label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_detailEdt.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_detailEdt.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

end.

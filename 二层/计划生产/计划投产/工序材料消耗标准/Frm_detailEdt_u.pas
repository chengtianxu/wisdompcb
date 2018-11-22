unit Frm_detailEdt_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGridEh, ExtCtrls,ComCtrls;

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
    FGrd:TListView;
    PreColumn: TColumnEh;
    field_name:string;
    Ftp:integer;
  public
    class function InitEdt(Grd:TListView;tp:integer):boolean;
  end;

var
  Frm_detailEdt: TFrm_detailEdt;

implementation
 uses DataModuleUnit;
{$R *.dfm}

class function TFrm_detailEdt.InitEdt(Grd:TListView;tp:integer): boolean;
var i:integer;
begin
  with TFrm_detailEdt.Create(nil) do
  begin
    DM.ADO73.Filter:='';
    DM.ADO73.Close;
    DM.ADO73.SQL.Text:='SELECT Data0073.RKEY, Data0073.USER_LOGIN_NAME AS user_id, Data0073.USER_FULL_NAME, Data0005.PHONE '+
                       'FROM   Data0073 INNER JOIN '+
                       '       Data0005 ON Data0073.EMPLOYEE_PTR = Data0005.RKEY AND Data0073.EMPLOYEE_PTR = Data0005.RKEY '+
                       'WHERE     (Data0073.USER_GROUP_FLAG = 1) AND (Data0073.ACTIVE_FLAG = 0) '+
                       'ORDER BY Data0073.USER_LOGIN_NAME ';

    DM.ADO73.Open;
    if DM.ADO73.IsEmpty then
    begin
      showmessage('当前没有可用操作员...');
      result:=false;
      free;
    end else begin
      field_name:='user_id';
      PreColumn := Grd1.Columns[0] ;
      PreColumn.Title.Color := clred ;
      FGrd:=Grd;
      Ftp:=tp;
      showmodal;
      DM.ADO73.Close;
    end;
  end;
end;

procedure TFrm_detailEdt.BitBtn1Click(Sender: TObject);
var
  i:integer;
  badd: Boolean;
begin
  badd := True;
  try
    for I := 0 to FGrd.Items.Count - 1 do
    begin
      if FGrd.Items[I].Data = Pointer(DM.ADO73.Fieldbyname('rkey').AsInteger) then
      begin
        ShowMessage('已有人员请勿重复添加！');
        bAdd := False;
        Exit;
      end;
    end;    
    //新增
    if Ftp = 0 then
    begin
      if bAdd then
      begin
        with FGrd.Items.Add do
        begin
          Caption := DM.ADO73.Fieldbyname('user_id').AsString;
          SubItems.Add(DM.ADO73.Fieldbyname('user_full_name').AsString);
          SubItems.Add(DM.ADO73.fieldbyname('PHONE').AsString);
          Data := Pointer(DM.ADO73.Fieldbyname('rkey').AsInteger);
        end;
        DM.ADO73.Delete;
      end;
    end else
    //编辑
    begin
      if FGrd.Selected <> nil then
      begin
        with FGrd.Selected do
        begin
          Caption := DM.ADO73.Fieldbyname('user_id').AsString;
          SubItems.Add(DM.ADO73.Fieldbyname('user_full_name').AsString);
          SubItems.Add(DM.ADO73.fieldbyname('PHONE').AsString);
          Data := Pointer(DM.ADO73.Fieldbyname('rkey').AsInteger);
        end;
      end;
    end;
  finally
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

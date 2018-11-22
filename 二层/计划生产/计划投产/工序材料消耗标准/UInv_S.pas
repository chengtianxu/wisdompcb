unit UInv_S;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ExtCtrls, Grids, DBGridEh, Buttons,ComCtrls;

type
  TInv_form = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Grd1: TDBGridEh;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
  private
    FGrd:TListView;
    PreColumn: TColumnEh;
    field_name:string;
    Ftp:integer;
    { Private declarations }
  public
    class function InitEdt(Grd:TListView;tp:integer):boolean;
    { Public declarations }
  end;

var
  Inv_form: TInv_form;

implementation

uses DataModuleUnit,InputUnit;

{$R *.dfm}

class function TInv_form.InitEdt(Grd:TListView;tp:integer): boolean;
var i:integer;
begin
  with TInv_form.Create(nil) do
  begin
    DM.ADO017.Filter:='';
    DM.ADO017.Close;
    DM.ADO017.Open;
    if DM.ADO017.IsEmpty then
    begin
      showmessage('当前没有可用的材料...');
      result:=false;
      free;
    end else begin
      field_name:='INV_PART_NUMBER';
      PreColumn := Grd1.Columns[0] ;
      PreColumn.Title.Color := clred ;
      FGrd:=Grd;
      Ftp:=tp;
      showmodal;
      DM.ADO017.Close;
    end;
  end;
end;

procedure TInv_form.Edit1Change(Sender: TObject);
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

procedure TInv_form.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

procedure TInv_form.BitBtn1Click(Sender: TObject);
var
  i,j:integer;
  badd: Boolean;
begin
  badd := True;
  try
    for I := 0 to FGrd.Items.Count - 1 do
    begin
      if FGrd.Items[I].Data = Pointer(DM.ADO017.Fieldbyname('rkey').AsInteger) then
      begin
        ShowMessage('已有物料请勿重复添加！');
        bAdd := False;
        Exit;
      end;
    end;
    if FGrd.Items.Count > 0 then
    begin
      if FGrd.Items[0].SubItems[1] <> DM.ADO017.Fieldbyname('UNIT_NAME').AsString then
      begin
        badd := False;
        ShowMessage('由于标准设定有统一的计量单位，不可以选择单位不同的材料');
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
          Caption := DM.ADO017.Fieldbyname('INV_PART_NUMBER').AsString;
          SubItems.Add(DM.ADO017.Fieldbyname('INV_PART_DESCRIPTION').AsString);
          SubItems.Add(DM.ADO017.Fieldbyname('UNIT_NAME').AsString);
          //SubItems.Add(DM.ADO017.Fieldbyname('rkey').AsString);
          Data := Pointer(DM.ADO017.Fieldbyname('rkey').AsInteger);
        end;
        FrmInput.lblUnitName.Caption := DM.ADO017.Fieldbyname('UNIT_NAME').AsString;
        FrmInput.lblUnitName.Hint := DM.ADO017.Fieldbyname('Rkey02').AsString;
        DM.ADO017.Delete;
      end;
    end else
    //编辑
    begin
      if FGrd.Selected <> nil then
      begin
        with FGrd.Selected do
        begin
          Caption := DM.ADO017.Fieldbyname('INV_PART_NUMBER').AsString;
          SubItems.Add(DM.ADO017.Fieldbyname('INV_PART_DESCRIPTION').AsString);
          SubItems.Add(DM.ADO017.Fieldbyname('UNIT_NAME').AsString);
          //SubItems.Add(DM.ADO017.Fieldbyname('rkey').AsString);
          Data := Pointer(DM.ADO017.Fieldbyname('rkey').AsInteger);
        end;
    FrmInput.lblUnitName.Caption := DM.ADO017.Fieldbyname('UNIT_NAME').AsString;
    FrmInput.lblUnitName.Hint := DM.ADO017.Fieldbyname('Rkey02').AsString;        
      end;
    end;



//    if (FGrd.Cells[4,1] <> '') and (FGrd.RowCount >= 2) then
//    if DM.ADO017.Fieldbyname('Rkey02').AsString <>  FGrd.Cells[4,1]  then
//    begin
//      ShowMessage('由于标准设定有统一的计量单位，不可以选择单位不同的材料');
//      Abort;
//    end;
//    FGrd.Cells[0,i]:=DM.ADO017.Fieldbyname('INV_PART_NUMBER').AsString;
//    FGrd.Cells[1,i]:=DM.ADO017.Fieldbyname('INV_PART_DESCRIPTION').AsString;
//    FGrd.Cells[2,i]:=DM.ADO017.Fieldbyname('rkey').AsString;
//    FGrd.Cells[3,i]:=DM.ADO017.Fieldbyname('UNIT_NAME').AsString;
//    FrmInput.lblUnitName.Caption := DM.ADO017.Fieldbyname('UNIT_NAME').AsString;
//    FrmInput.lblUnitName.Hint := DM.ADO017.Fieldbyname('Rkey02').AsString;
//    FGrd.Cells[4,i]:=DM.ADO017.Fieldbyname('Rkey02').AsString;
//    //FGrd.Cells[3,i]:=DM.ADO017.fieldbyname('PHONE').AsString;
//    DM.ADO017.Delete;
  finally
    if DM.ADO017.IsEmpty then self.close;
  end;

end;

procedure TInv_form.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker=smNoneEh) or (column.Title.SortMarker =smDownEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO017.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO017.Sort:=Column.FieldName+' DESC';
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

end.

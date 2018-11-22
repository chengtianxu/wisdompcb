unit UVMIForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGridEh, Buttons, ExtCtrls,common,math,
  DB,ComObj,ADODB, Menus,DateUtils;

type
  TVMIForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    DTPK1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    BitBtn6: TBitBtn;
    PopupMenu1: TPopupMenu;
    Grd1: TDBGridEh;
    procedure BitBtn4Click(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DTPK1Click(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsCheck:string;
    FCondition:string;
    FisWrite,FisAudit,FisAudit_self:boolean;
    sqltxt: tstringList;
    procedure item_click(sender:TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VMIForm: TVMIForm;

implementation

uses DM_u;

{$R *.dfm}

procedure TVMIForm.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
  QueryTmp:TADOQuery;
begin

  if dm.ADOCon.Connected then
  begin
      QueryTmp:=TADOQuery.Create(Self);
      QueryTmp.Connection := DM.ADOCon;
      Self.BtBrushClick(nil);
      field_name := Grd1.Columns[0].FieldName;
      PreColumn := Grd1.Columns[0];
      Grd1.Columns[0].Title.Color := clred ;
      for i:=1 to Grd1.Columns.Count do
      begin
          item := TmenuItem.Create(self) ;
          item.Caption := Grd1.Columns[i-1].Title.Caption ;

          if Grd1.Columns[i-1].Visible then
              item.Checked := true ;
              item.OnClick := item_click ;
              PopupMenu1.Items.Add(item) ;
      end;
      with QueryTmp do
      begin
        close;
        sql.Text:='select getdate() as sys_date';
        open;
        dtpk2.Date:=DateOf(fieldvalues['sys_date']);
      //  self.sys_longdate:= formatdatetime('yyyy-mm-dd',fieldvalues['sys_date']);
        dtpk1.Date:=dtpk2.Date-30;
        self.DTPK1Click(sender);
      end;
        QueryTmp.Free;
  end;

end;

procedure TVMIForm.BitBtn4Click(Sender: TObject);
begin
if Grd1.DataSource.DataSet.Active then
              if Grd1.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(Grd1,'VMI¿â´æÊý¾Ý') ;
end;

procedure TVMIForm.BtCloseClick(Sender: TObject);
begin
  close;
end;

procedure TVMIForm.Edit1Change(Sender: TObject);
begin

  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    Grd1.DataSource.DataSet.Filtered := True;
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

procedure TVMIForm.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADOVMI.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADOVMI.Sort:=Column.FieldName+' DESC';
  end;
  //DM.ADOVMIAfterScroll(DM.ADOVMI);
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
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

procedure TVMIForm.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to Grd1.FieldCount - 1 do
              if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      Grd1.Columns[i].Visible := true ;
                      break ;
                  end ;
      end
  else
      begin
          for i := 0 to Grd1.FieldCount - 1 do
              if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      Grd1.Columns[i].Visible := false ;
                      break ;
                  end ;
      end ;
end;

procedure TVMIForm.BitBtn6Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TVMIForm.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADOVMI.SQL.Text);
end;

procedure TVMIForm.DTPK1Click(Sender: TObject);
var
  lDate: TDateTime;
  datetmp:string;
begin
  dm.ADOVMI.Close;
  dm.ADOVMI.Parameters.ParamValues['dtpk1']:= dtpk1.Date;
  dm.ADOVMI.Parameters.ParamValues['dtpk2']:=dtpk2.Date+1;
  DM.ADOVMI.Parameters.ParamValues['uptr']:=StrToInt(rkey73);
  dm.ADOVMI.Open;   
end;

procedure TVMIForm.BtBrushClick(Sender: TObject);
var
  i:integer;
begin
  if DM.ADOVMI.IsEmpty then exit;
  i := DM.ADOVMIrkey.AsInteger ;
  DM.ADOVMI.Close;
  DM.ADOVMI.Open;
  DM.ADOVMI.Locate('rkey',i,[]);
end;

end.

unit u_hideitem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, common,Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons,DB;

type
  Tfrm_hideitem = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    edt_1: TEdit;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject); 
    procedure CheckBox1Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name, StrsTemp, statusTag, orginal_text : string;
  public
    { Public declarations }
  end;

var
  frm_hideitem: Tfrm_hideitem;

implementation

uses damo;

{$R *.dfm}

procedure Tfrm_hideitem.FormCreate(Sender: TObject);
begin
  dm.ADOhideitem.Active := false;
  dm.ADOhideitem.CommandText := dm.ADOhideitem.CommandText
  + ' and departmentid in (select departmentid from hr_permission '
  + ' where operator_ptr= ' + rkey73
  + ' and program_ptr=(select rkey from data0419 where programe =''EmpSalary.exe'')) ';
  dm.ADOhideitem.Active := true;
  field_name := DBGridEh1.Columns[1].FieldName;
  PreColumn := DBGridEh1.Columns[1];
  dm.ADOhideitem.Filter := '';
  orginal_text := dm.ADOhideitem.CommandText;
end;

procedure Tfrm_hideitem.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.ADOhideitem.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADOhideitem.Sort:=Column.FieldName+' DESC';
  end;
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edt_1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    edt_1Change(edt_1);
  end
  else
    edt_1.SetFocus;
end;

procedure Tfrm_hideitem.edt_1Change(Sender: TObject);
begin
    DBGridEh1.DataSource.DataSet.Filtered := True;
    if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
    if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
    begin
      if trim(edt_1.text) <> '' then
        begin
          if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
            begin
              DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
            end
          else
            if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
            begin
              DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
            end;
        end
      else
        DBGridEh1.DataSource.DataSet.Filter:='';
    end;
end;

procedure Tfrm_hideitem.BitBtn2Click(Sender: TObject);
begin
    Export_dbGridEH_to_Excel(DBGridEh1, '员工薪资隐藏项目');
end;

procedure Tfrm_hideitem.BitBtn3Click(Sender: TObject);
var h_sort,h_Filter,h_employeecode : string;
begin
 try
  h_employeecode := dm.ADOhideitememployeecode.AsString;
  h_Filter := dm.ADOhideitem.Filter;
  h_sort := dm.ADOhideitem.Sort;

  dm.ADOhideitem.UpdateBatch();
  showmessage('保存成功');
  dm.ADOhideitem.Active := false;
  dm.adohideitem.Active := true;

  dm.ADOhideitem.Filter := h_Filter;
  dm.ADOhideitem.Sort := h_sort;
  dm.ADOhideitem.Locate('employeecode',h_employeecode,[]);

  except
  showmessage('保存失败');
  end;
end; 
procedure Tfrm_hideitem.CheckBox1Click(Sender: TObject);
var h_sort,h_Filter,h_employeecode : string;
begin
  h_employeecode := dm.ADOhideitememployeecode.AsString;
  h_Filter := dm.ADOhideitem.Filter;
  h_sort := dm.ADOhideitem.Sort;
  dm.ADOhideitem.Active := false;

  if  CheckBox1.Checked   then
  begin
    dm.ADOhideitem.CommandText := orginal_text+' and f79>0 ';
  end
  else
  begin
    dm.ADOhideitem.CommandText := orginal_text;
  end;

  dm.adohideitem.Active := true;
  dm.ADOhideitem.Filter := h_Filter;
  dm.ADOhideitem.Sort := h_sort;
  if h_employeecode<>'' then  dm.ADOhideitem.Locate('employeecode',h_employeecode,[]);

end;

end.

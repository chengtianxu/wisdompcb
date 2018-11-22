unit Frm_Look_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ExtCtrls,DB, Buttons;

type
  TFrm_Look = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtQry: TBitBtn;
    Edit1: TEdit;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Grd1: TDBGridEh;
    Grd2: TDBGridEh;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox7: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Edit1Change(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure CheckBox7Click(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    Fs,Fs1:string;
  public
     procedure init;
  end;

var
  Frm_Look: TFrm_Look;

implementation
uses DM_u,Frm_QrySet_u,common;
{$R *.dfm}

{ TFrm_Look }

procedure TFrm_Look.init;
var s:string;
begin
  s:='select data0219.*,(case data0219.ttype when 1 then ''库房到钻机'' when 2 then ''钻机到库房''  when 3 then ''待磨到研磨商'''
                   +' when 4 then ''研磨商到库房'' end) ttype_c, (select top 1 location_code  from data0160 where rkey='
      +' (case when data0219.location_fromptr is null then data0219.location_endptr else data0219.location_fromptr end)) location_code,'
+' data0005.employee_name from data0219 inner join data0005 on data0219.create_by=data0005.rkey ';
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
  dm.ADO219_1.Close;
  DM.ADO219_1.SQL.Clear;
  DM.ADO219_1.SQL.Text:=s;
  sSql := dm.ADO219_1.SQL.Text ;
  Fs1:='data0219.ttype<>0 and create_date>=getdate()-3';
  dm.ADO219_1.SQL.Text:=sSql+' where '+Fs1+' order by data0219.grn_number';
//  Fs1:=' where data0219.ttype<>0 and create_date>=getdate()-3 order by data0219.grn_number';
//  dm.ADO219_1.SQL.Text:=sSql+Fs1;
  dm.ADO219_1.Close;
  dm.ADO219_1.Open;
end;

procedure TFrm_Look.Edit1Change(Sender: TObject);
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

procedure TFrm_Look.Grd1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker =smDownEh then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.ADO219_1.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADO219_1.Sort:=Column.FieldName+' DESC';
  end;
  if field_name <> column.FieldName then
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

procedure TFrm_Look.CheckBox7Click(Sender: TObject);
var i:integer;
    str:string;
begin
  Fs:='0,';
  for i:=0 to GroupBox1.ControlCount-1 do
    if  not TCheckBox(GroupBox1.Controls[i]).Checked then Fs:=Fs+inttostr(GroupBox1.Controls[i].Tag)+',';
  FS:=Fs+'15';
  dm.ADO219_1.SQL.Text:=sSql+' where '+Fs1+' and not data0219.ttype in ('+Fs+') order by data0219.grn_number';
  dm.ADO219_1.Close;
  dm.ADO219_1.Open;
end;

procedure TFrm_Look.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];

    Fs1:='data0219.create_date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
                           ''' and data0219.create_date<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''''+Sqlstr;
    CheckBox7Click(nil);
  end;
   
end;

procedure TFrm_Look.BtCloseClick(Sender: TObject);
begin
  close;
  dm.ADO219_1.SQL.Text:=sSql ;
end;

procedure TFrm_Look.BtBrushClick(Sender: TObject);
begin
  dm.ADO219_1.Close;
  dm.ADO219_1.Open;
end;

procedure TFrm_Look.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO219_1.SQL.Text);
end;

procedure TFrm_Look.BitBtn1Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(Grd1,self.Caption);
end;

procedure TFrm_Look.BitBtn2Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(Grd2,self.Caption);
end;

end.

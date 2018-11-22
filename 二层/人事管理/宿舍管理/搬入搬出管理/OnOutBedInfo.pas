unit OnOutBedInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, DB, ADODB,
  ComCtrls, Menus, DM, common, UpInDate, UpOutDate;

type
  TFrmOnOutBedInfo = class(TForm)
    dgh_grd1: TDBGridEh;
    bbt_1: TBitBtn;
    pnl1: TPanel;
    Panel1: TPanel;
    bbt_2: TBitBtn;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BitBtn1: TBitBtn;
    edt_1: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    lb_1: TLabel;
    edt_OperateDate: TEdit;
    lb_11: TLabel;
    edt_Operator: TEdit;
    Label2: TLabel;
    dtpDate: TDateTimePicker;
    bbt_3: TBitBtn;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure dgh_grd1TitleClick(Column: TColumnEh);
    procedure edt_1Change(Sender: TObject);
    procedure bbt_1Click(Sender: TObject);
    procedure bbt_2Click(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure pm_1Popup(Sender: TObject);
    procedure dgh_grd1ColEnter(Sender: TObject);
    procedure chk_1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOnOutBedInfo: TFrmOnOutBedInfo;

implementation

{$R *.dfm}


procedure TFrmOnOutBedInfo.FormShow(Sender: TObject);
begin
  damo.qry5.Close;
  damo.qry5.Open;
  damo.qry6.Close;
  damo.qry6.Open;
  field_name := dgh_grd1.Columns[0].FieldName;
  PreColumn := dgh_grd1.Columns[0];
  dgh_grd1.Columns[0].Title.Color := clred ;
  label1.Caption := '员工工号';
  dtpDate.DateTime := Now;
  edt_OperateDate.Text := DateToStr(Now);
  with damo.qrytemp do
  begin
    SQL.Text := 'select rkey, employee_name from data0005 where data0005.rkey= '+ user_ptr;
    open;
    edt_Operator.Text := fieldbyName('employee_name').AsString;
    edt_Operator.Tag := fieldbyName('rkey').AsInteger;
  end;
end;

procedure TFrmOnOutBedInfo.dgh_grd1TitleClick(Column: TColumnEh);
begin
  if dgh_grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    damo.qry5.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    damo.qry5.Sort:=Column.FieldName+' DESC';
  end;
  if dgh_grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
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
  label1.Left := edt_1.Left - label1.Width - 5;
end;

procedure TFrmOnOutBedInfo.edt_1Change(Sender: TObject);
begin
  dgh_grd1.DataSource.DataSet.Filtered := True;
  if dgh_grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_1.text) <> '' then
      begin
        if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          begin
            dgh_grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edt_1.text) + '%'')' ;
          end
        else
          if dgh_grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          begin
            dgh_grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edt_1.text,0))+')';
          end;
      end
    else
      dgh_grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrmOnOutBedInfo.bbt_1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmOnOutBedInfo.bbt_2Click(Sender: TObject);
begin
  common.Export_dbGridEH_to_Excel(dgh_grd1,'搬入记录');
end;

procedure TFrmOnOutBedInfo.mniN1Click(Sender: TObject);
var
  BedCode, chinesename, IDCard: string;
  EmpRkey, BedroomusemsgRkey, Bedrkey: Integer;
begin
  if (strtoint(vprev) <> 4) and (strtoint(vprev) <> 2)then
  begin
    ShowMessage('对不起，您的权限不够！');
    Exit;
  end;
  Bedrkey := damo.qry5.FieldValues['BedRkey'];
  EmpRkey := damo.qry5.FieldValues['Emprkey'];
  IDCard := damo.qry5.FieldValues['IDCard'];
  BedroomusemsgRkey := damo.qry5.FieldValues['BedUseMsgrkey'];
  BedCode := damo.qry5.FieldValues['B_code'];
  chinesename := damo.qry5.FieldValues['chinesename'];
  if MessageDlg('确定要将员工 '+chinesename+' 离宿？', mtInformation, [mbYes, mbNo], 1) = mryes then
  begin
    with damo.qrytemp do
    begin
      //更新床位表employeeid
      SQL.Text := Format('update bedmsg set employeeid=NULL where B_code=''%s'' ', [BedCode]);
      ExecSQL;
      //更新人事表employeemsg的roomcode
      SQL.Text := Format('update employeemsg set roomcode=NULL where IDCard= ''%s'' ', [IDCard]);
      ExecSQL;
      //更新住宿登记表roomcode
      SQL.Text := Format('update employeemsg_extra set roomcode=NULL where rkey= %d ', [EmpRkey]);
      ExecSQL;
      //插入一条搬出记录
      SQL.Text := Format('update Bedroomusemsg set enddate=''%s'', operator_out=%d, oper_time_out=''%s'', remark=''%s'' '
        +'where rkey=%d ', [DateToStr(dtpDate.Date), edt_Operator.Tag, edt_OperateDate.Text,
        '', BedroomusemsgRkey]);
      ExecSQL;
      //更新房间表 monitor
      SQL.Text := Format('update Bedroommsg set monitor=NULL where R_code=''%s'' ',[damo.qry2.FieldByName('R_code').AsString]);
      ExecSQL;
      ShowMessage('员工 '+ chinesename +' 离宿成功！');
    end;
    damo.qry2.Close;
    damo.qry2.Open;
    damo.qry5.Close;
    damo.qry5.Open;
  end;
end;

procedure TFrmOnOutBedInfo.pm_1Popup(Sender: TObject);
begin
  if not damo.qry5.FieldByName('enddate').IsNull then N1.Enabled := False
  else N1.Enabled := True;
end;

procedure TFrmOnOutBedInfo.dgh_grd1ColEnter(Sender: TObject);
begin
 if not damo.qry5.FieldByName('enddate').IsNull then bbt_3.Enabled := False
  else bbt_3.Enabled := True;
end;

procedure TFrmOnOutBedInfo.chk_1Click(Sender: TObject);
begin
  {dgh_grd1.DataSource.DataSet.Filtered := False;
  dgh_grd1.DataSource.DataSet.Filtered := True;
  if chk_1.Checked then
    dgh_grd1.DataSource.DataSet.Filter:=' (out_name = null )';
  if CheckBox1.Checked then
    dgh_grd1.DataSource.DataSet.Filter:=' (out_name <> null )';
  if chk_1.Checked and CheckBox1.Checked then
    dgh_grd1.DataSource.DataSet.Filter:='';
  if (CheckBox1.Checked = False) and (chk_1.Checked = false) then
    dgh_grd1.DataSource.DataSet.Filter:='';}
end;

procedure TFrmOnOutBedInfo.Edit1Change(Sender: TObject);
begin
  DBGridEh1.DataSource.DataSet.Filtered := True;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
      begin
        if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
          begin
            DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(Edit1.text) + '%'')' ;
          end
        else
          if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
          begin
            DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(Edit1.text,0))+')';
          end;
      end
    else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrmOnOutBedInfo.BitBtn1Click(Sender: TObject);
begin
  common.Export_dbGridEH_to_Excel(DBGridEh1, '已搬离员工记录');
end;

procedure TFrmOnOutBedInfo.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    damo.qry6.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    damo.qry6.Sort:=Column.FieldName+' DESC';
  end;
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    Label3.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    Edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(edt_1);
  end
  else
    Edit1.SetFocus;
  Label3.Left := Edit1.Left - Label3.Width - 5;
end;

procedure TFrmOnOutBedInfo.N3Click(Sender: TObject);
begin
  if strtoint(vprev) <> 4 then
  begin
    ShowMessage('对不起，您的权限不够！');
    Exit;
  end;
  FrmIndate := TFrmIndate.Create(Application);
  FrmIndate.ShowModal;
  FrmIndate.Free;
end;

procedure TFrmOnOutBedInfo.N2Click(Sender: TObject);
begin
  if strtoint(vprev) <> 4 then
  begin
    ShowMessage('对不起，您的权限不够！');
    Exit;
  end;
  FrmOutdate := TFrmOutdate.Create(Application);
  FrmOutdate.ShowModal;
  FrmOutdate.Free;
end;

end.

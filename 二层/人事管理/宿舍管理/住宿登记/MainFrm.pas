unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, DB, ADODB,
  ComCtrls, Menus, Damo, common, IniFiles;

type
  TFrmMain = class(TForm)
    pnl1: TPanel;
    bbt_1: TBitBtn;
    bbt_2: TBitBtn;
    bbt_3: TBitBtn;
    dgh_grd1: TDBGridEh;
    edt_1: TEdit;
    label1: TLabel;
    bbt_4: TBitBtn;
    bbt_5: TBitBtn;
    pm_1: TPopupMenu;
    mniN1: TMenuItem;
    mniN2: TMenuItem;
    mniN3: TMenuItem;
    mniN4: TMenuItem;
    Panel1: TPanel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    N1: TMenuItem;
    procedure bbt_1Click(Sender: TObject);
    procedure edt_1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dgh_grd1TitleClick(Column: TColumnEh);
    procedure bbt_4Click(Sender: TObject);
    procedure bbt_5Click(Sender: TObject);
    procedure bbt_3Click(Sender: TObject);
    procedure mniN4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbt_2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure pm_1Popup(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    field_name:string;

  public
    orginal_sql_str : string;
    new_sql_str1:     string;
    new_sql_str2:     string;
    new_sql_str3:     string;
    new_sql_str4:     string;
    new_sql_str5:     string;
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  UpdateMrm;
{$R *.dfm}

procedure TFrmMain.bbt_1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TFrmMain.edt_1Change(Sender: TObject);
begin
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
  label2.Caption := inttostr(dm.qryMain.RecordCount);
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
   try
     dm.qry_update.ExecSQL;
   except
     showmessage('住宿人员信息刷新失败');
   end;

  field_name := dgh_grd1.Columns[0].FieldName;
  PreColumn := dgh_grd1.Columns[0];
  dgh_grd1.Columns[0].Title.Color := clred ;
  label1.Caption := dgh_grd1.Columns[0].Title.Caption;
end;

procedure TFrmMain.dgh_grd1TitleClick(Column: TColumnEh);
begin
  if dgh_grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.qryMain.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.qryMain.Sort:=Column.FieldName+' DESC';
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
end;

//删除（更新表employeemsg_extra的Flag为4）
procedure TFrmMain.bbt_4Click(Sender: TObject);
begin
  if (((strtoint(vprev) = 1) or (strtoint(vprev)= 3 )) and  (Tmenuitem(Sender).Tag in [1])) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  with DM.qryTemp do
  begin
    SQL.Clear;
    SQL.Text := 'select roomcode from employeemsg_extra where rkey=' + IntToStr(DM.qryMain.FieldValues['rkey']);
    Open;
    if not FieldByName('roomcode').IsNull then
    begin
      ShowMessage('该员工已经入住，请搬离后再进行删除！');
      Exit;
    end;
    if MessageDlg('确定要删除该员工登记记录？', mtInformation, [mbYes, mbNo], 1) = mryes then
    begin
      SQL.Clear;
      SQL.Text := 'update employeemsg_extra set flag=4,cardno='+#39+#39+' where rkey=' + IntToStr(DM.qryMain.FieldValues['rkey']);
      ExecSQL;
    end;
  end;
  DM.qryMain.Close;
  DM.qryMain.Open;
  label2.Caption := inttostr(dm.qryMain.RecordCount);
end;

//新增
procedure TFrmMain.bbt_3Click(Sender: TObject);
var
  i: Integer;
begin
  if (((strtoint(vprev) = 1) or (strtoint(vprev)= 3 )) and  (Tmenuitem(Sender).Tag in [1])) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;

  i := DM.qryMain.FieldByName('rkey').AsInteger;

  Dm.Tag := 0;
  UpdateFrm := TUpdateFrm.Create(Application);
  UpdateFrm.ShowModal;
  UpdateFrm.Free;
  DM.qryMain.Close;

  radiogroup1.ItemIndex := 0;
  dm.qryMain.SQL.Text := self.orginal_sql_str;
  DM.qryMain.Open;
  dm.qryMain.Sort := 'regdate DESC ';
  label2.Caption := inttostr(dm.qryMain.RecordCount);
  DM.qryMain.Locate('rkey',i, []);
end;

//修改
procedure TFrmMain.bbt_5Click(Sender: TObject);
var
  i: Integer;
begin
  if (((strtoint(vprev) = 1) or (strtoint(vprev)= 3 )) and  (Tmenuitem(Sender).Tag in [1])) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  i := DM.qryMain.FieldValues['rkey'];
  Dm.Tag := 1;
  UpdateFrm := TUpdateFrm.Create(Application);
  UpdateFrm.ShowModal;
  UpdateFrm.Free;
  DM.qryMain.Close;
  DM.qryMain.Open;
  label2.Caption := inttostr(dm.qryMain.RecordCount);
  DM.qryMain.Locate('rkey',i, []);
end;

//查看
procedure TFrmMain.mniN4Click(Sender: TObject);
begin
  Dm.Tag := 2;
  UpdateFrm := TUpdateFrm.Create(Application);
  UpdateFrm.ShowModal;
  UpdateFrm.Free;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
 if not app_init(dm.con1) then
  begin
    common.ShowMsg('程序启动失败,请联系系统管理员',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title; 
   {//
  user_ptr:='686'; //人员ID
  vprev:='4';    //权限
  rkey73:='9';   //
  //
  dm.con1.Open;
  //  }
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  self.orginal_sql_str := dm.qryMain.SQL.Text;
  self.new_sql_str1 := dm.qryMain.SQL.Text +
  ' and employeemsg_extra.rkey in ( select employeeid from bedroomusemsg '+
  ' where enddate is null) and flag=0 ';
  self.new_sql_str2 := dm.qryMain.SQL.Text +
      ' and employeemsg_extra.rkey not in ( ' +
      ' select employeeid from bedroomusemsg ' +
      ' where enddate is null) '+
      ' and len(outdutytime)=0 '+
      ' and flag=0 ';
  self.new_sql_str3 := dm.qryMain.SQL.Text +
      ' and employeemsg_extra.rkey in (     '+
      ' select employeeid from bedroomusemsg '+
      ' where enddate is null) '+
      ' and flag=0 '+
      ' and len(outdutytime)<>0 ';
  self.new_sql_str4 := dm.qryMain.SQL.Text +  ' and employeemsg_extra.flag=0 ';

  self.new_sql_str5 := dm.qryMain.SQL.Text +  ' and employeemsg_extra.flag=1 ';

  DM.qryMain.Close;
  DM.qryMain.Open;
  label2.Caption := inttostr(dm.qryMain.RecordCount);
end;

procedure TFrmMain.bbt_2Click(Sender: TObject);
var
  i: Integer;
begin  i := DM.qryMain.FieldValues['rkey'];
  DM.qryMain.Close;
  DM.qryMain.Open;
  label2.Caption := inttostr(dm.qryMain.RecordCount);
  DM.qryMain.Locate('rkey',i, []);
end;

procedure TFrmMain.RadioGroup1Click(Sender: TObject);
begin
    if dm.qryMain.Active then dm.qryMain.Close;
    
    case  radiogroup1.itemindex of
    0:  begin
         dm.qryMain.SQL.Text := self.orginal_sql_str;
        end;
    1:  begin
         dm.qryMain.SQL.Text := self.new_sql_str1;
        end;
    2:  begin
         dm.qryMain.SQL.Text := self.new_sql_str2;
        end;
    3:  begin
         dm.qryMain.SQL.Text := self.new_sql_str3;
        end;
    4:  begin
         dm.qryMain.SQL.Text := self.new_sql_str4;
        end;
    5:  begin
         dm.qryMain.SQL.Text := self.new_sql_str5;
        end;
    end;
   try
    dm.qryMain.Open;
    dm.qryMain.Sort := ' regdate DESC';
    label2.Caption := inttostr(dm.qryMain.RecordCount);
   except
    showmessage('过滤失败');
   end;
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
  common.Export_dbGridEH_to_Excel(dgh_grd1,'住宿人员登记名单');
end;

procedure TFrmMain.N1Click(Sender: TObject);
var outdutystr: string;
    f :TDateTime;
begin
  if (((strtoint(vprev) = 1) or (strtoint(vprev)= 3 )) and  (Tmenuitem(Sender).Tag in [1])) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
  outdutystr := dm.qryMainoutdutytime.Value;
  if TryStrToDate(outdutystr,f)
   then
   begin
DM.qryTemp.SQL.Text := ' update Bedroomusemsg '+
                  ' set enddate='+#39+outdutystr+#39+',operator_out='+user_ptr+','+
                  ' oper_time_out=getdate()'+
                  ' from Bedroomusemsg '+
                  ' where employeeid='+ inttostr(dm.qryMainrkey.Value)+
                  ' and enddate is null '+
                  ' update Bedmsg '+
                  ' set employeeid=null '+
                  ' from Bedmsg where '+
                  ' employeeid= '+ inttostr(dm.qryMainrkey.Value)+
                  ' update employeemsg_extra '+
                  ' set  roomcode='+#39+#39+
                  ' from employeemsg_extra '+
                  ' where employeecode='+#39+(dm.qryMainemployeecode.value)+#39+
                  ' update employeemsg '+
                  ' set  roomcode='+#39+#39+
                  ' from employeemsg '+
                  ' where idcard='+#39+(dm.qryMainidcard.value)+#39+
                  ' and status=2 ';
    try 
      dm.qryTemp.ExecSQL;
      ShowMessage('操作成功');
      bbt_2.Click;
    except
      ShowMessage('操作失败');
    end;
   end
   else
   begin
    messagedlg('离职日期格式不正确，请修改离职日期为YYYY-MM-DD格式',mtinformation,[mbok],0);
    Exit;
   end;
end;

procedure TFrmMain.pm_1Popup(Sender: TObject);
begin
  n1.Visible := False;
 if ( RadioGroup1.ItemIndex =3  ) and (dgh_grd1.DataSource.DataSet.RecordCount >0 )
 then   n1.Visible := True;

end;

procedure TFrmMain.FormActivate(Sender: TObject);
var a: Integer;
begin
     dm.qrytemp1.SQL.Text := new_sql_str3;
     dm.qrytemp1.Open;
     a := DM.qrytemp1.Recordset.RecordCount;
     dm.qrytemp1.Close;
     dm.qrytemp1.SQL.Clear;
 if (a > 0) then  showmessage('请注意将离职人员搬出');
end;

end.

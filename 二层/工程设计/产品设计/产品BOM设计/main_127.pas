unit main_127;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, ComCtrls, Buttons, ExtCtrls,
  DBGridEh, Menus;

type
  Tfrmmain_127 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    Grd1: TDBGridEh;
    label1: TLabel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    M1: TMenuItem;
    MenuItem3: TMenuItem;
    M5: TMenuItem;
    M6: TMenuItem;
    M2: TMenuItem;
    M3: TMenuItem;
    M4: TMenuItem;
    N3: TMenuItem;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure BitBtn5Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);

  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsBOM_status:string;
    sqlstr:string;
    FisInit:boolean;
    procedure DoSearch(subSql:string);
    procedure item_click(sender:TObject);
    procedure Enter_Detail;
  public
    { Public declarations }
  end;

var
  frmmain_127: Tfrmmain_127;

implementation
uses MyClass,ConstVar,common,QuerySet,dm,product_MiDetail, Pick_BOM_Item;
{$R *.dfm}

procedure Tfrmmain_127.FormCreate(Sender: TObject);
var s:string;
begin
  if not App_Init(dmcon.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
    exit;
  end;
  self.Caption :=Application.Title;


// user_ptr:='78';
// vprev:='4';
// dmcon.ADOConnection1.Open;

  FisInit:=true;
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
  if vprev='2' then
  begin
    CheckBox1.Checked:=true;
    FsBOM_status:=' and d25.BOM_status=0 ';
  end else if vprev='4' then
  begin
    CheckBox2.Checked:=true;
    FsBOM_status:=' and d25.BOM_status=2 ';
  end else begin
   CheckBox1.Checked:=true;
   CheckBox2.Checked:=true;
   CheckBox3.Checked:=true;
   CheckBox4.Checked:=true;
   FsBOM_status:='';
  end;
  sqlstr:=' and d25.LAST_MODIFIED_DATE>getdate()-30 ';
  sSql:=dmcon.adsProdLists.CommandText;
  dmcon.adsProdLists.CommandText:=dmcon.adsProdLists.CommandText+FsBOM_status+sqlstr+' order by '+field_name;
  dmcon.adsProdLists.Open;
  FisInit:=false;
end;

procedure Tfrmmain_127.FormShow(Sender: TObject);
var
  i:integer;
  MI:TMenuItem;
begin
  for i:= 0 to Grd1.Columns.Count- 1 do
  begin
    MI:=TmenuItem.Create(self);
    MI.Caption:=Grd1.Columns[i].Title.Caption;
    if Grd1.Columns[i].Visible then
      MI.Checked:=true;
    MI.OnClick:=item_click;
    self.PopupMenu1.Items.Add(MI);
  end;
  MyDataClass := TMyDataClass.Create(dmcon.ADOConnection1);
end;

procedure Tfrmmain_127.BitBtn1Click(Sender: TObject);
begin
  MyDataClass.Free;
  frmQuerySet.Free;
  close;
end;

procedure Tfrmmain_127.BitBtn3Click(Sender: TObject);
var rkey25:integer;
begin
  if not dmcon.adsProdLists.Active then exit;
  rkey25:=dmcon.adsProdLists.FieldByName('rkey').AsInteger;
  dmcon.adsProdLists.close;
  dmcon.adsProdLists.open;
  dmcon.adsProdLists.Locate('rkey',rkey25,[]);
end;

procedure Tfrmmain_127.BitBtn2Click(Sender: TObject);
begin
  if not dmcon.adsProdLists.IsEmpty then
  Export_dbGridEH_to_Excel(Grd1,'产品BOM设计列表')
end;

procedure Tfrmmain_127.BitBtn4Click(Sender: TObject);
var
  i:integer;
begin
  if frmQuerySet=nil then
  begin
    frmQuerySet:=TfrmQuerySet.Create(nil);
    frmQuerySet.dtpk1.Date:=date()-30;
    frmQuerySet.dtpk2.Date:=date();
  end;
  with frmQuerySet do
    if ShowModal = mrOk then
    begin
      sqlstr:='';
      for i:=1 to sgrid1.RowCount-2 do
      begin
        if sgrid1.Cells[2,i]<> '' then
          Sqlstr:=sqlstr+sgrid1.Cells[2,i];
      end;
      sqlstr:=sqlstr+' and LAST_MODIFIED_DATE>='+QuotedStr(Formatdatetime('yyyy-mm-dd',dtpk1.Date))+' and LAST_MODIFIED_DATE<'+QuotedStr(Formatdatetime('yyyy-mm-dd',dtpk2.Date+1)) ;
      DoSearch(sqlstr);
    end;
end;

procedure Tfrmmain_127.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
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

procedure Tfrmmain_127.DoSearch(subSql: string);
begin
  dmcon.adsProdLists.Close;
  if PreColumn.Title.SortMarker=smDownEh then
    dmcon.adsProdLists.CommandText := sSql+FsBOM_status+subsql+' order by '+field_name +' desc'
  else
    dmcon.adsProdLists.CommandText := sSql+FsBOM_status+subsql+' order by '+field_name ;
  dmcon.adsProdLists.open;
end;

procedure Tfrmmain_127.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dmcon.adsProdLists.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dmcon.adsProdLists.Sort:=Column.FieldName+' DESC';
  end;
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

procedure Tfrmmain_127.item_click(sender: TObject);
var
 i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  for i:=0 to Grd1.Columns.Count-1 do
    if Grd1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
    begin
      Grd1.Columns[i].Visible:=(sender as tmenuItem).Checked;
      break;
    end;
end;

procedure Tfrmmain_127.BitBtn5Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure Tfrmmain_127.PopupMenu2Popup(Sender: TObject);
var
  iMI,iBOM:integer;
begin
  if dmcon.adsProdLists.IsEmpty then abort;
  iMI:=dmcon.adsProdLists.FieldByName('TSTATUS').Asinteger;
  iBOM:=dmcon.adsProdLists.FieldByName('BOM_STATUS').Asinteger;
{case D25.BOM_STATUS when 0 then 'MI待后补'
                     when 1 then 'BOM待审'
                     when 2 then 'BOM待制作'
                     when 4 then 'BOM已审'
end as BOM_Status_CN,
}
  M1.Enabled:=(iMI=1) and (iBOM=0) and (vprev='2');
  M2.Enabled:=M1.Enabled;

  M3.Enabled:=(iMI=1) and (iBOM=2) and (vprev='4');
  M4.Enabled:=M3.Enabled;
  M5.Enabled:=M3.Enabled;
end;

procedure Tfrmmain_127.Enter_Detail;
begin
  try
    application.CreateForm(tForm2,Form2);
    dmcon.AQY0025.Close;
    dmcon.AQY0025.Parameters[0].Value:=dmcon.adsProdLists.FieldByName('rKey').Asinteger;
    dmcon.AQY0025.Open;
    form2.ShowModal;
  finally
    form2.free;
    dmcon.FD494Modified:=false;
  end
end;

procedure Tfrmmain_127.M1Click(Sender: TObject);
var rkey:string;
begin
{BOM_Status
0：待后补
2：后补提交
1：BOM提交
4：BOM已审
}
  dmcon.FTag:=TMenuItem(Sender).Tag;
  rKey:=dmcon.adsProdLists.FieldByname('rKey').AsString;
  dmcon.tmp.Close;
  case dmcon.FTag of
    0,3,5: Enter_Detail;
        1:begin
            dmcon.tmp1.Close;
            dmcon.tmp1.SQL.Text:='SELECT  top 1 data0494.step_number,data0025.MANU_PART_NUMBER '+
            'FROM  dbo.Data0494 inner join data0025 on data0494.custpart_ptr=data0025.rkey '+
            'where data0025.rkey in (select rkey from data0025 where rkey='+rkey+
                                    ' union select rkey from data0025 where parent_ptr='+rkey+
                                    ' union select rkey from data0025 where parent_ptr in (select rkey from data0025 where parent_ptr='+rkey+')) '+
            'and Data0494.flow_spfc_flag=''Y'' and '+
            'Data0494.after_flag=''Y'' and isnull(Data0494.PARAMETER_VALUE,'''')=''''';

            dmcon.tmp1.Open;
            if not dmcon.tmp1.IsEmpty then
            begin
              ShowMsg(dmcon.tmp1.Fields[1].AsString+'工序制程参数第'+dmcon.tmp1.Fields[0].AsString+'步为重点参数,其值不能为空!',1);
              exit;
            end;

            dmcon.tmp.SQL.Text:='update data0025 set candidate_BY='+user_ptr+', candidate_DATE=getdate(),BOM_Status=2 where rkey='+dmcon.adsProdLists.fieldbyname('rkey').AsString+' and BOM_Status=0 and TSTATUS=1' ;
           //后补提交
          end;
        2: dmcon.tmp.SQL.Text:='update data0025 set candidate_BY='+user_ptr+', candidate_DATE=getdate(),BOM_Status=0 where rkey='+dmcon.adsProdLists.fieldbyname('rkey').AsString+' and BOM_Status=2 and TSTATUS=1' ;
           //后补退回
        4:begin  //BOM提交
            dmcon.tmp.Close;
            dmcon.tmp.SQL.Text:='select '+rKey+
                                ' as rkey,'''+dmcon.adsProdLists.FieldByname('manu_part_number').AsString+''' as manu_part_number union all '+
                                'select rkey,manu_part_number from data0025 where parent_ptr='+rKey+
                                ' union all '+
                                ' select rkey,manu_part_number from data0025 where parent_ptr in (select rKey from data0025 where parent_ptr ='+rkey+')';
            dmcon.tmp.Open;
            while not dmcon.tmp.Eof do
            begin
              dmcon.tmp1.Close;
              dmcon.tmp1.SQL.Text:='select top 1 rkey from data0026 where MANU_BOM_PTR ='+dmcon.tmp.Fields[0].AsString;
              dmcon.tmp1.Open;
              if dmcon.tmp1.IsEmpty then
              begin
                if MessageBox(self.Handle,pchar(dmcon.tmp.Fields[1].AsString+' BOM记录为空,确定继续提交吗？'),pchar('提示'),MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=IDNO then
                exit;
              end;
              dmcon.tmp.Next;
            end;
            dmcon.tmp.SQL.Text:='update data0025 set BOM_APPR_BY='+user_ptr+', BOM_APPR_DATE=getdate(),BOM_Status=1 where rkey='+dmcon.adsProdLists.fieldbyname('rkey').AsString+' and BOM_Status=2 and TSTATUS=1' ;
          end;
  end;
  if (dmcon.FTag in [1,2,4]) and (dmcon.tmp.ExecSQL<>1) then
    ShowMsg('MI数据状态发生变化,操作失败',1)
  else if dmcon.FTag in [1,2,4] then
  begin   //更新内层状态
    rkey:='';
    dmcon.tmp.Close;
    dmcon.tmp.SQL.Text:='select d25_0.rkey,isnull(d25_1.rkey,0) rkey1, isnull(d25_2.rkey,0) rkey2 from data0025 d25_0 left join data0025 d25_1 '+
                     'on d25_1.parent_ptr=d25_0.rkey ' +
                     ' LEFT JOIN data0025 d25_2 ON d25_2.parent_ptr=d25_1.rkey' + 
                     ' where d25_0.parent_ptr='+dmcon.adsProdLists.fieldbyname('rkey').AsString;
    dmcon.tmp.Open;
    while not dmcon.tmp.Eof do
    begin
      rkey:=rkey+dmcon.tmp.Fields[0].AsString+','+dmcon.tmp.Fields[1].AsString+','+dmcon.tmp.Fields[2].AsString+',';
      dmcon.tmp.Next;
    end;
    dmcon.tmp.Close;
    if rkey<>''  then
    begin
      rkey:='('+rkey+'0)';
      case dmcon.FTag of
       1: dmcon.tmp1.SQL.Text:='update data0025 set candidate_BY='+user_ptr+', candidate_DATE=getdate(),BOM_Status=2 where rkey in '+rkey;
       2: dmcon.tmp1.SQL.Text:='update data0025 set candidate_BY='+user_ptr+', candidate_DATE=getdate(),BOM_Status=0 where rkey in '+rkey;
       4: dmcon.tmp1.SQL.Text:='update data0025 set BOM_APPR_BY='+user_ptr+', BOM_APPR_DATE=getdate(),BOM_Status=1 where rkey in '+rkey;
      end;
      dmcon.tmp1.ExecSQL;
    end;
  end;
  BitBtn3Click(nil);
end;

procedure Tfrmmain_127.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ([ssShift, ssAlt]=Shift) and (key=83) then
    showmessage(dmcon.adsProdLists.CommandText);
end;

procedure Tfrmmain_127.CheckBox1Click(Sender: TObject);
var i:integer;
begin
 if FisInit then exit;
 FsBOM_status:='';
  for i:=0 to Panel2.ControlCount-1 do
    if Panel2.Controls[i] is TCheckBox and  TCheckBox(Panel2.Controls[i]).Checked then
  FsBOM_status:=FsBOM_status+inttostr(TCheckBox(Panel2.Controls[i]).Tag)+',' ;
  if FsBOM_status<>'' then
    FsBOM_status:=' and d25.BOM_status in ('+copy(FsBOM_status,1,length(FsBOM_status)-1)+')'
  else
    FsBOM_status:=' and d25.BOM_status=-1 ';
  DoSearch(sqlstr);
end;

end.


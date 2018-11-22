unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, Menus, StdCtrls, Buttons, ExtCtrls,db,
  ppEndUsr, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppBands, ppCache, ppPrnabl, ppCtrls,DBGridEhImpExp, ADODB;

type
  TMAIN_Form = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    BitBtn6: TBitBtn;
    BtQry: TBitBtn;
    PopupMenu2: TPopupMenu;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    CheckBox0: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N_Edit: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N5: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    BitBtn2: TBitBtn;
    ppDBPipeline1: TppDBPipeline;
    ppDBPipeline2: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppDBText5: TppDBText;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
    ppLabel10: TppLabel;
    ppDBText9: TppDBText;
    ppLabel11: TppLabel;
    ppDBText10: TppDBText;
    ppLabel12: TppLabel;
    ppDBText11: TppDBText;
    ppLabel13: TppLabel;
    ppDBText12: TppDBText;
    ppLabel14: TppLabel;
    ppDBText13: TppDBText;
    ppLabel15: TppLabel;
    ppDBText14: TppDBText;
    ppLabel16: TppLabel;
    ppDBText15: TppDBText;
    ppLabel17: TppLabel;
    ppDBText16: TppDBText;
    ppLabel18: TppLabel;
    ppDBText17: TppDBText;
    ppLabel20: TppLabel;
    ppDBText19: TppDBText;
    ppLabel21: TppLabel;
    ppDBText20: TppDBText;
    ppLabel22: TppLabel;
    ppDBText21: TppDBText;
    ppLabel19: TppLabel;
    ppDBText18: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLabel23: TppLabel;
    ppDBText22: TppDBText;
    ppLabel24: TppLabel;
    ppDBText23: TppDBText;
    ppLabel25: TppLabel;
    ppDBText24: TppDBText;
    ppLabel26: TppLabel;
    ppDBText25: TppDBText;
    ppLine21: TppLine;
    lblcount: TLabel;
    N_SuspProd: TMenuItem;
    N_ResuProd: TMenuItem;
    CheckBox5: TCheckBox;
    N13: TMenuItem;
    btFind: TSpeedButton;
    BOM: TMenuItem;
    N4: TMenuItem;
    BitBtn5: TBitBtn;
    qrytemp: TADOQuery;
    mni_EditPHOur: TMenuItem;
    N11: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox0Click(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N_EditClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N_SuspProdClick(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N_ResuProdClick(Sender: TObject);
    procedure btFindClick(Sender: TObject);
    procedure BOMClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure AddAllBOMClick(Sender: TObject);
    procedure mni_EditPHOurClick(Sender: TObject);
    procedure N11Click(Sender: TObject);
  private
    { Private declarations }


   sql_text,Fsql:string;
   strStatusValue:string;
   PreColumn: TColumnEh;
   procedure item_click(sender:TObject);
   function getwarehouse_code(v_type:byte):string;
   procedure touchang(v_type:byte);
   procedure RefreshData(rKey:integer);//刷新数据
//   function status_468(cut_no:string;status:byte):boolean;

  public
    
    procedure OutputExcelStd(AForm:TForm;ADBGridEh:TDBGridEh);
    { Public declarations }
  end;

var
  MAIN_Form: TMAIN_Form;
  curr_date:tdatetime;

implementation

uses DAMO,common, condition, locateso, putprod,  Udetail,
   formInputDlg, DisplayData_unt, ProdBOM_unt,
  Detailed1_unt,UPHourEdit;  //  Input_Edit_unt,

{$R *.dfm}

procedure TMAIN_Form.FormCreate(Sender: TObject);
begin

//common.user_ptr:='926';
// common.vprev:='4';
// common.rkey73:='414';
//dm.ADOConnection1.Open;


 ////////////////////////////////////////////////////

 
  if not App_init_2(dm.ADOConnection1) then
   begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
   end; 


  self.Caption:=application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;

procedure TMAIN_Form.item_click(sender:TObject);
var i:byte;
begin
 (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
 if (sender as tmenuItem).Checked then
 begin
  for i:=0 to DBGridEh1.FieldCount-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=true;
    break;
   end;
 end
 else begin
  for i:=0 to DBGridEh1.FieldCount-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;
{
function TMAIN_Form.status_468(cut_no: string;status:byte): boolean;
begin
  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='select rkey from data0468 where status in (0,1) and cut_no='+
              quotedstr(cut_no);

    open;
  //  ShowMessage(SQL.Text);
  end;
  if not dm.ADOQuery1.IsEmpty then
    result:=true
  else
    with dm.ADOQuery1 do
    begin
      close;
      sql.Text:='select rkey from data0492 where cut_no='+quotedstr(cut_no)+
                ' and tstatus='+inttostr(status);
      open;
       //ShowMessage(SQL.Text);
      if IsEmpty then
       result:=true
      else
       result:=false;
    end;
end;
}
procedure TMAIN_Form.BitBtn1Click(Sender: TObject);
begin
close;
application.Terminate;
end;

procedure TMAIN_Form.BitBtn3Click(Sender: TObject);
var
  v_rkey: integer;
begin
  v_rkey := 0;
  if not dm.ADS492.IsEmpty then  v_rkey := dm.ADS492rkey.Value;
  dm.ADS492.Close;
  dm.ADS492.Open;
  if v_rkey > 0 then  dm.ADS492.Locate('rkey',v_rkey,[]);
  lblcount.Caption := '当前显示数目：'+ IntToStr(dm.ADS492.RecordCount);
end;

procedure TMAIN_Form.BitBtn4Click(Sender: TObject);
begin
  if not dm.ADS492.IsEmpty then
  if MessageBox(Handle,'确定要导出数据吗？','询问',MB_YESNO+MB_iconquestion+MB_DEFBUTTON1)=IDNO	then
    exit;
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
  //OutputExcelStd(Self,DBGridEh1);
end;

procedure TMAIN_Form.OutputExcelStd(AForm:TForm;ADBGridEh:TDBGridEh);
var
  ExpClass:TDBGridEhExportClass  ;
  Ext:String;
  FFileName:string;
  SaveDialog1:TSaveDialog;
begin
  SaveDialog1:=TSaveDialog.Create(AForm);
  SaveDialog1.Filter:='*.xls|*.xls|*.csv|*.csv|*.htm|*.htm|*.txt|*.txt';
  SaveDialog1.FileName := AForm.Caption;
 // if (ActiveControl is TDBGridEh) then
  if SaveDialog1.Execute then
  begin
    case SaveDialog1.FilterIndex of
      1: begin ExpClass := TDBGridEhExportAsXLS;  Ext := 'xls'; end;
      2: begin ExpClass := TDBGridEhExportAsCSV;  Ext := 'csv'; end;
      3: begin ExpClass := TDBGridEhExportAsHTML; Ext := 'htm'; end;
      4: begin ExpClass := TDBGridEhExportAsText; Ext := 'txt'; end;
    else
      ExpClass := nil; Ext := '';
    end;

    if ExpClass <> nil then
    begin
      if UpperCase(Copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-2,3)) <>
          UpperCase(Ext) then
        FFileName := SaveDialog1.FileName + '.' + Ext;
      if   FileExists(FFileName)   then
      if messagedlg('文件“'+FFileName+'”已经存在,你要覆盖吗?',mtconfirmation,[mbyes,mbno],0)=mrNo then
        Exit;
      try
        Screen.Cursor := crHourGlass;
        ADBGridEh.DataSource.DataSet.DisableControls;
        SaveDBGridEhToExportFile(ExpClass,ADBGridEh,FFileName,True);    //导出全部数据。
      finally
        ADBGridEh.DataSource.DataSet.EnableControls;
        Screen.Cursor := crDefault;
      end;
      
    //　SaveDBGridEhToExportFile(ExpClass,TDBGridEh(ActiveControl),pExpFile,False);  //导出选择数据
    end;
  end;
end;

procedure TMAIN_Form.BitBtn6Click(Sender: TObject);
begin
 popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMAIN_Form.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;

begin
  if dm.ADOConnection1.Connected then
  begin
    curr_date:=getsystem_date(dm.ADOQuery1,1);
    dm.ADS492.Close;
    dm.ADS492.Parameters.ParamByName('uptr2').Value:=StrToInt(rkey73);
    dm.ADS492.Parameters[1].Value:=curr_date-7;
    dm.ADS492.Parameters[2].Value:=curr_date+1;
    sql_text := dm.ADS492.CommandText;
    Fsql:='select * , '+
  ' case when phour>0  and (isnull(ARHour,0)-Rhour)>=0 then cast(convert(numeric(18,1),(isnull(ARHour,0)-Rhour)/phour*100) as varchar)+''%''  else '''' '+
  ' end  as progress'+       //and (isnull(ARHour,0)-Rhour)>=0
  ' from #temp492     '+
  ' if exists (select * from tempdb.dbo.sysobjects'+
  ' where id = object_id(N''tempdb..#temp492'') and type=''U'')  drop table #temp492'  ;

    CheckBox0Click(nil);
    btFindClick(nil);
    //dm.ADS492.Open;
    lblcount.Caption := '当前显示数目：' + IntToStr(DM.ADS492.RecordCount);
    PreColumn := DBGridEh1.Columns[0];
    for i:=1 to DBGridEh1.Columns.Count do
    begin
      item := TmenuItem.Create(self) ;
      item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;
      if DBGridEh1.Columns[i-1].Visible then
        item.Checked := true ;
      item.OnClick := item_click ;
      self.PopupMenu2.Items.Add(item) ;
    end;
  end;
end;

procedure TMAIN_Form.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS492.CommandText);
end;

procedure TMAIN_Form.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   dm.ADS492.IndexFieldNames:=Column.FieldName;
  end
  else begin
   column.Title.SortMarker:=smDownEh;
   dm.ADS492.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TMAIN_Form.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dm.ADS492.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else dm.ADS492.filter := '';
end;

procedure TMAIN_Form.CheckBox0Click(Sender: TObject);
begin
  strStatusValue:='';
  if CheckBox0.Checked and CheckBox1.Checked and CheckBox2.Checked and
     CheckBox3.Checked and CheckBox4.Checked and CheckBox5.Checked then
    Exit;                               //如果记录的6种状态都要查询的话，退出。因为该查询条件根本不需要存在，查询速度会更快。
//0已审核1未审核2不审核3已取消4已完工5已暂停
  if CheckBox0.Checked then
    strStatusValue:=strStatusValue+'0,';

  if CheckBox1.Checked then
    strStatusValue:=strStatusValue+'1,';

  if CheckBox2.Checked then
    strStatusValue:=strStatusValue+'2,';

  if CheckBox3.Checked then
    strStatusValue:=strStatusValue+'3,';

  if CheckBox4.Checked then
    strStatusValue:=strStatusValue+'4,';

  if CheckBox5.Checked then
    strStatusValue:=strStatusValue+'5,';

  if  strStatusValue<>'' then
  begin                            //    去掉后面的一个","
    strStatusValue:='and Data0492.TSTATUS in ('+copy(strStatusValue,0,Length(strStatusValue)-1)+')';
  end; 
 // ShowMessage(strStatusValue);
//  dm.ADS492.Close;

//  if not checkbox0.Checked then
//    dm.ADS492.Parameters[2].Value:=0           //有效的
//  else
//    dm.ADS492.Parameters[2].Value:=9;
//
//  if not checkbox1.Checked then           //未审核
//    dm.ADS492.Parameters[3].Value:=1
//  else
//    dm.ADS492.Parameters[3].Value:=9;
//
//  if not checkbox2.Checked then           //不审核
//    dm.ADS492.Parameters[4].Value:=2
//  else
//    dm.ADS492.Parameters[4].Value:=9;
//
//  if not checkbox3.Checked then           //已取消
//    dm.ADS492.Parameters[5].Value:=3
//  else
//    dm.ADS492.Parameters[5].Value:=9;
//
//  if not checkbox4.Checked then           // 已完成
//    dm.ADS492.Parameters[6].Value:=4
//  else
//    dm.ADS492.Parameters[6].Value:=9;
//
//  dm.ADS492.open;
//
//  lblcount.Caption := '当前显示数目：'+ IntToStr(dm.ADS492.RecordCount);
end;

procedure TMAIN_Form.BtQryClick(Sender: TObject);
var i:byte;
begin
  with condition_form do
  begin
    dtpk1.Date:=common.getsystem_date(qrytemp,0);  // strtodate(formatdatetime('yyyy-mm-dd',dm.ADS492.Parameters.ParamValues['dtpk1']));
    dtpk2.Date:=common.getsystem_date(qrytemp,0);; // strtodate(formatdatetime('yyyy-mm-dd',dm.ADS492.Parameters.ParamValues['dtpk2']))-1;
    if ShowModal=mrok then
     begin
      dm.ADS492.close;
      dm.ADS492.CommandText:=self.sql_text+#13+strStatusValue+#13;
      for i:=1 to condition_form.SGrid1.RowCount-2 do
        dm.ADS492.CommandText:=dm.ADS492.CommandText+condition_form.SGrid1.Cells[2,i]+#13;

        dm.ADS492.CommandText:=dm.ADS492.CommandText +Fsql; //20180110 tao

       dm.ADS492.Parameters.ParamByName('uptr2').Value:=StrToInt(rkey73);
      dm.ADS492.Parameters.ParamByName('dtpk1').Value:=strtodatetime(formatdatetime('yyyy-mm-dd',condition_form.dtpk1.Date));
      dm.ADS492.Parameters.ParamByName('dtpk2').Value:=strtodatetime(formatdatetime('yyyy-mm-dd',condition_form.dtpk2.Date))+1;
      dm.ADS492.open;
      lblcount.Caption := '当前显示数目：'+ IntToStr(dm.ADS492.RecordCount);
    end;
  end;
end;

function TMAIN_Form.getwarehouse_code(v_type: byte): string;
begin
  with dm.ADOQuery1 do
  begin
    close;
    sql.Text := 'select rkey,WAREHOUSE_CODE from data0015';
    open;
    if (not IsEmpty) and (recordcount = 1)then
    begin
      if v_type = 0 then
        result:=fieldbyname('rkey').AsString
      else
        result:=fieldbyname('WAREHOUSE_CODE').AsString;
    end
    else
     result := '';
  end;
end;

procedure TMAIN_Form.touchang(v_type: byte); //0:按订单投,1:补料投
var
 i:integer;
 j:integer;
begin
  try
    locateso_form:=tlocateso_form.Create(application);
    locateso_form.ADScp70.Close;

    if  v_type=0 then                                  //按订单投
      locateso_form.ADScp70.Parameters[0].Value:=3
    else                                               //补料投
      locateso_form.ADScp70.Parameters[0].Value:=4;

    locateso_form.ADScp70.Open;
    while locateso_form.ShowModal=mrok do
    begin
      if locateso_form.ADScp71.FieldByName('rkey08').AsString='' then
      begin
        ShowMessage('该投产项目为管控项目,你当前的权限不允许该投产操作.');
        Continue;
      end; 
      try
        putprod_form:=tputprod_form.Create(locateso_Form);
        with putprod_form do
        begin
          locateso_form.ADScp71.First;
          dm.aqy04.Close;
          dm.aqy04.Open;
          stg1.RowCount:= locateso_form.ADScp71.RecordCount+1;
          combobox1.ItemIndex:=v_type;
          aded_flag:=1; //新增
          for i:=1 to locateso_form.ADScp71.RecordCount do
          begin
            if dm.aqy04SEED_FLAG.Value<>1 then
            stg1.cells[0,i]:=dm.aqy04SEED_VALUE.Value+'-'+inttostr(i); //'配料单号';

            stg1.cells[1,i]:=locateso_form.ADScp70sales_order.Value;  //'销售订单';
            stg1.cells[2,i]:=locateso_form.ADScp71PROD_CODE.Value;    //'产品代码';
            stg1.cells[3,i]:=locateso_form.ADScp71quantity.AsString;  //'订单数量';
            if v_type=0 then
            stg1.cells[4,i]:=stg1.cells[3,i]                         //'投产数量';
            else
            stg1.cells[4,i]:='0';
            stg1.cells[5,i]:=locateso_form.ADScp70DEPT_NAME.Value;    //'制造部门';
            stg1.cells[6,i]:=formatdatetime('yyyy-mm-dd hh:nn:ss',getsystem_date(dm.ADOQuery1,0)); //'投产日期';
            stg1.cells[7,i]:=locateso_form.ADScp71complete_date.AsString;    //'完工日期';
            stg1.cells[8,i]:=getwarehouse_code(1);                           //'工厂代码';
            stg1.cells[9,i]:='';

            stg1.cells[10,i]:=getwarehouse_code(0);                          //'rkey15';
            stg1.cells[11,i]:=locateso_form.ADScp71rkey08.AsString;          //'rkey08';
            stg1.cells[12,i]:=locateso_form.ADScp70produce_deptptr.AsString; //'rkey34';
            stg1.cells[13,i]:='';                                      //无用
            stg1.cells[14,i]:=locateso_form.ADScp71rkey.AsString;            //'rkeycp71';
            stg1.cells[15,i]:=locateso_form.ADScp71PRODUCT_NAME.Value;    //'产品名称';
            stg1.cells[16,i]:=locateso_form.ADScp71PRODUCT_DESC.Value;    //'产品名称';


            with dm.ADOQuery1 do
            begin
              close;
             { sql.Text:=                                     //lisa
              'SELECT     dbo.Data0002.UNIT_NAME, dbo.DATA0148.QUAN_BOM,'+#13+
              'dbo.DATA0148.VENDOR, dbo.DATA0148.INVENT_PTR, dbo.Data0008.PROD_CODE,'+#13+
              'dbo.Data0008.PRODUCT_NAME, dbo.Data0008.PRODUCT_DESC, dbo.Data0008.qty_onhand'+#13+
              'FROM         dbo.DATA0148 INNER JOIN'+#13+
              'dbo.DATA0140 ON dbo.DATA0148.PART_PTR = dbo.DATA0140.rkey INNER JOIN'+#13+
              'dbo.Data0002 INNER JOIN'+#13+
              'dbo.Data0008 ON dbo.Data0002.RKEY = dbo.Data0008.unit_ptr ON'+#13+
              ' dbo.DATA0148.INVENT_PTR = dbo.Data0008.RKEY'+#13+
              'WHERE     (dbo.DATA0148.Invent_or = 1)'+#13+
              'and DATA0140.status=1'+#13+
              'and data0140.PART_PTR='+stg1.cells[11,i]; }

              sql.Text:=
              'SELECT     dbo.Data0002.UNIT_NAME, dbo.wzcp0495.QUAN_BOM,'+#13+
              'dbo.wzcp0495.VENDOR, dbo.wzcp0495.INVENT_PTR, dbo.Data0008.PROD_CODE,'+#13+
              'dbo.Data0008.PRODUCT_NAME, dbo.Data0008.PRODUCT_DESC, dbo.Data0008.qty_onhand'+#13+
              'FROM         dbo.wzcp0495 INNER JOIN'+#13+
              'dbo.wzcp0494 ON dbo.wzcp0495.PARTBOM_PTR = dbo.wzcp0494.rkey INNER JOIN'+#13+
              'dbo.Data0002 INNER JOIN'+#13+
              'dbo.Data0008 ON dbo.Data0002.RKEY = dbo.Data0008.unit_ptr ON'+#13+
              ' dbo.wzcp0495.INVENT_PTR = dbo.Data0008.RKEY'+#13+
              'WHERE   '+#13+         //  (dbo.wzcp0495.Invent_or = 1) and
              ' wzcp0494.status=1'+#13+
              'and wzcp0494.PART_PTR='+stg1.cells[11,i];

              //ShowMessage(sql.Text);
              open;
            end;
           { stg2.RowCount:=stg2.RowCount+dm.ADOQuery1.RecordCount;

            for j:=1 to dm.ADOQuery1.RecordCount do
            begin
              with putprod_form.stg2 do
              begin
                cells[0,stg2.RowCount-2-dm.ADOQuery1.RecordCount+j] := putprod_form.stg1.cells[0,i];          //'配料单号';
                cells[1,stg2.RowCount-2-dm.ADOQuery1.RecordCount+j] := putprod_form.stg1.cells[1,i];          //'销售订单';
                cells[2,stg2.RowCount-2-dm.ADOQuery1.RecordCount+j] := putprod_form.stg1.cells[5,i];          //'制造部门';

                cells[4,stg2.RowCount-2-dm.ADOQuery1.RecordCount+j] := dm.ADOQuery1.fieldbyname('PROD_CODE').AsString;       //'材料编码';
                cells[5,stg2.RowCount-2-dm.ADOQuery1.RecordCount+j] := dm.ADOQuery1.fieldbyname('PRODUCT_NAME').AsString;    //'材料名称';
                cells[6,stg2.RowCount-2-dm.ADOQuery1.RecordCount+j] := dm.ADOQuery1.fieldbyname('PRODUCT_DESC').AsString;    //'材料规格';
                cells[7,stg2.RowCount-2-dm.ADOQuery1.RecordCount+j] := dm.ADOQuery1.fieldbyname('UNIT_NAME').AsString;       //'单位';
                cells[8,stg2.RowCount-2-dm.ADOQuery1.RecordCount+j]:=dm.ADOQuery1.fieldbyname('qty_onhand').AsString;        //'当前库存';
                if v_type=0 then

                  cells[9,stg2.RowCount-2-dm.ADOQuery1.RecordCount+j]:=
                     floattostr(dm.ADOQuery1.fieldbyname('QUAN_BOM').Value*
                                strtoint(putprod_form.stg1.cells[4,i]))
                else
                cells[9,stg2.RowCount-2-dm.ADOQuery1.RecordCount+j]:=dm.ADOQuery1.fieldbyname('QUAN_BOM').AsString;          //'配额';

                cells[10,stg2.RowCount-2-dm.ADOQuery1.RecordCount+j]:='原材料'; //半成品  lisa   //'类型';
                cells[11,stg2.RowCount-2-dm.ADOQuery1.RecordCount+j]:='Y';            //'列印';
                cells[12,stg2.RowCount-2-dm.ADOQuery1.RecordCount+j]:=dm.ADOQuery1.fieldbyname('VENDOR').AsString;         //'备注';
                cells[13,stg2.RowCount-2-dm.ADOQuery1.RecordCount+j]:='待确认';      //'状态';
                cells[14,stg2.RowCount-2-dm.ADOQuery1.RecordCount+j]:='';   //无用
                cells[15,stg2.RowCount-2-dm.ADOQuery1.RecordCount+j]:=dm.ADOQuery1.fieldbyname('INVENT_PTR').AsString;    //'rkey17';
              end;

              dm.ADOQuery1.Next;
            end;}

            locateso_form.ADScp71.Next;
          end;
        end;
        if putprod_form.ShowModal=mrok then
        begin
          with dm.ADOQuery2 do
          begin
            close;
            sql.Text:=
            'update wzcp0070 set status=4 where sales_order='+
            quotedstr(putprod_form.stg1.Cells[1,1])+
            ' and status=3';
            ExecSQL;
          end;

          if dm.ADOConnection1.InTransaction then
          dm.ADOConnection1.CommitTrans;
          dm.ADS492.Close;
          dm.ADS492.Open;
          dm.ADS492.Locate('CUT_NO',dm.ADOQuery1.fieldbyname('cut_no').AsString,[]);
          Break;
        end;
      finally
        putprod_form.Free;
      end;


    end;


  finally
    locateso_form.Free;
  end;
end;

procedure TMAIN_Form.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 showmsg('对不起,您只有本程序的只读权限',1)
else
 self.touchang(1);
end;

procedure TMAIN_Form.N1Click(Sender: TObject);
begin

if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 showmsg('对不起,您只有本程序的只读权限',1)
else
 self.touchang(0);
end;

procedure TMAIN_Form.PopupMenu1Popup(Sender: TObject);
begin
  n7.Enabled:=(dm.ADS492TSTATUS.Value=1) or (dm.ADS492TSTATUS.Value=2); //取消投产
  N_Edit.Enabled:=((dm.ADS492TSTATUS.Value=0) or (dm.ADS492TSTATUS.Value=2)) and
             (not dm.ADS492.IsEmpty); //编辑
  n10.Enabled:=((dm.ADS492TSTATUS.Value=0) or (dm.ADS492TSTATUS.Value=2)) and
             (not dm.ADS492.IsEmpty);
  n8.Enabled:=not dm.ADS492.IsEmpty;
  
  N_SuspProd.Enabled := (not dm.ADS492.IsEmpty)and(dm.ADS492TSTATUS.AsInteger in [0,2]) and (StrToInt(vprev)=4);
  N_ResuProd.Enabled := (not dm.ADS492.IsEmpty)and(dm.ADS492TSTATUS.AsInteger in [5])and (StrToInt(vprev)=4);
  BOM.       Enabled := (DM.ADS492.IsEmpty = False);
 // AddAllBOM. Enabled := (StrToInt(vprev)=4) and (DM.ADS492.IsEmpty = False);
end;

procedure TMAIN_Form.N7Click(Sender: TObject);
begin
 if DM.ADS492.FieldByName('ctrl').AsInteger=1 then
 begin
   ShowMessage('该项目为管控项目,你当前的权限不允许操作该项目.');
   Exit;
 end;
  if (strtoint(vprev)<>4) then
  begin
    showmsg('对不起,您只有本程序的只读权限',1);
    Exit;
  end;
 if StrToInt(DM.ADS492ORD_REQ_QTY.AsString) > 0 then
  begin
      ShowMessage('该生产单号已提交入库，无法取消!');
      Exit;
  end;
  with DM.qrytemp do
  begin
    Close;
    SQL.clear;
    SQL.Text := 'select top 1 END_DATE from data0451 order by END_DATE desc';
    Open;
    if FieldByName('END_DATE').AsDateTime > DM.ADS492ISSUE_DATE.AsDateTime then
    begin
      ShowMessage('取消失败！该生产单已做存货结算处理，最新日期为：[' + FieldByName('END_DATE').AsString + ']');
      Exit;
    end;
  end;
  DM.ADS468.Close;
  DM.ADS468.Parameters[0].Value:=DM.ADS492CUT_NO.Value;
  DM.ADS468.Parameters[1].Value:=DM.ADS492CUT_NO.Value;
  DM.ADS468.Open;

  if not DM.ADS468.IsEmpty then
    ShowMessage('该生产单已有领料记录，无法取消！')
  {if status_468(dm.ADS492CUT_NO.Value,dm.ADS492TSTATUS.Value) then
    showmsg('生产单的物料明细已被确认或者生产单状态发生变化,取消失败!',1)}
  else
  if Msg_Dlg_Ask('你确认要取消该批生产单吗?','提示窗口',1) then
  begin

      try
        dm.ADOConnection1.BeginTrans;
        with dm.ADOQuery2 do
        begin
          close;
          sql.Text:='update wzcp0071'+#13+
                    'set QTY_PLANED=QTY_PLANED-data0492.ISSUED_QTY'+#13+
                    'FROM data0492 INNER JOIN'+#13+
                    'WZCP0071 ON dbo.data0492.PRINTED_BY_PTR = dbo.WZCP0071.rkey'+#13+
                    'where data0492.cut_no='+quotedstr(dm.ADS492CUT_NO.Value);
          ExecSQL;
        end;
        with dm.ADOQuery2 do
        begin
          close;
          sql.Text:='select rkey from wzcp0071 where qty_planed > 0 and '+
                    'so_ptr=(select rkey from wzcp0070 where sales_order='+
                    quotedstr(dm.ADS492SO_NO.Value)+
                    ')';
          open;
        end;
        if dm.ADOQuery2.IsEmpty then
        with dm.ADOQuery1 do
        begin
          close;
          sql.Text:='update wzcp0070 set status=3 where sales_order='+
                    quotedstr(dm.ADS492SO_NO.Value)+
                    ' and status=4';
          ExecSQL;
        end;

        with dm.ADOQuery2 do
        begin
          close;
          sql.Text:='update data0492 set tstatus=3,PRINTED_BY_PTR=null  where cut_no='+quotedstr(dm.ADS492CUT_NO.Value);
          ExecSQL;
        end;
        dm.ADOConnection1.CommitTrans;
        showmsg('取消操作成功！',1);
        BitBtn3Click(nil);
      except
        on E: Exception do
        begin
          dm.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
  end;
end;

procedure TMAIN_Form.N_EditClick(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 showmsg('对不起,您只有本程序的只读权限',1)
else
 if DM.ADS492.FieldByName('ctrl').AsInteger=1 then
 begin
   ShowMessage('该项目为管控项目,你当前的权限不允许操作该项目.');
   Exit;
 end;

 try
  putprod_form:=tputprod_form.Create(application);

  putprod_form.aded_flag:=2; // 编辑状态

  putprod_form.ComboBox1.ItemIndex :=
    putprod_form.ComboBox1.Items.IndexOf(dm.ADS492v_ttype.Value);
  if putprod_form.ShowModal=mrok then
   begin
    if dm.ADOConnection1.InTransaction then
    dm.ADOConnection1.CommitTrans;
    dm.ADS492.Close;
    dm.ADS492.Open;
    dm.ADS492.Locate('CUT_NO',dm.ADOQuery1.fieldbyname('cut_no').AsString,[]);
   end;
 finally
  putprod_form.Free;
 end;
end;

procedure TMAIN_Form.N8Click(Sender: TObject);
begin
   if DM.ADS492.FieldByName('ctrl').AsInteger=1 then
 begin
   ShowMessage('该项目为管控项目,你当前的权限不允许操作该项目.');
   Exit;
 end;


 
dm.ADS468.Parameters[0].Value := dm.ADS492.FieldValues['cut_no'];
dm.ADS468.Parameters[1].Value := dm.ADS492.FieldValues['cut_no'];
Detail_Form:=TDetail_Form.Create(application);
Detail_Form.ShowModal;
Detail_Form.Free;
end;

procedure TMAIN_Form.BitBtn2Click(Sender: TObject);
begin
DM.ADS492_p.Close;
dm.ADS492_P.Parameters[0].Value:=dm.ADS492CUT_NO.Value;
DM.ADS492_p.Open;

self.ppReport1.Reset;
self.ppReport1.Template.FileName :=
  stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
    'EP052_P.rtm';
self.ppReport1.Template.LoadFromFile;
self.ppReport1.SaveAsTemplate:=true;
self.ppdesigner1.ShowModal;
end;

procedure TMAIN_Form.N10Click(Sender: TObject);
begin
 if DM.ADS492.FieldByName('ctrl').AsInteger=1 then
 begin
   ShowMessage('该项目为管控项目,你当前的权限不允许操作该项目.');
   Exit;
 end;
 
  DM.ADS492_p.Close;
  dm.ADS492_P.Parameters[0].Value:=dm.ADS492CUT_NO.Value;
  DM.ADS492_p.Open;
  DM.ADS468_p.Close;
  DM.ADS468_p.Open;
 // showmessage(DM.ADS492_p.CommandText);
if (not dm.ADS468_p.IsEmpty) then
begin
  self.ppReport1.Reset;
  self.ppReport1.Template.FileName :=
    stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
   'EP052_P.rtm';
  self.ppReport1.Template.LoadFromFile;
  self.ppReport1.SaveAsTemplate:=false;
  self.ppReport1.Print;
end
else
 showmsg('无有效领料明细可以打印',1);
end;

procedure TMAIN_Form.N_SuspProdClick(Sender: TObject);
var
  str:string;
begin
 if DM.ADS492.FieldByName('ctrl').AsInteger=1 then
 begin
   ShowMessage('该项目为管控项目,你当前的权限不允许操作该项目.');
   Exit;
 end;

  if InputDlg(Self,'暂停','输入暂停原因',str) then
  try

    DM.ADOConnection1.BeginTrans;

    DM.ADOCommand1.CommandText :='insert into wzcp0493'+
    '([D492_ptr],[OldSTATUS],[TSTATUS],[Oper_date],[Oper_Empl],[remark]) '+
    'values('+DM.ADS492rkey.AsString+','+DM.ADS492TSTATUS.AsString+',7,getdate(),'+user_ptr+','+QuotedStr(str)+')';
    //ShowMessage(DM.ADOCommand1.CommandText);
    DM.ADOCommand1.Execute;

    DM.ADS492.Edit;
    DM.ADS492TSTATUS.AsInteger := 5;
    DM.ADS492.Post;

    DM.ADOConnection1.CommitTrans;
  except
    DM.ADOConnection1.RollbackTrans;
  end;
end;

procedure TMAIN_Form.N13Click(Sender: TObject);
begin
  with DM.ADS0493 do
  begin
    Close;
    Open;
  end;
  show_DisplayData_frm(Self,'查看暂停恢复日志', DM.ADS0493);
end;

procedure TMAIN_Form.N_ResuProdClick(Sender: TObject);
var
  str:string;
begin
 if DM.ADS492.FieldByName('ctrl').AsInteger=1 then
 begin
   ShowMessage('该项目为管控项目,你当前的权限不允许操作该项目.');
   Exit;
 end;
 
  if InputDlg(Self,'恢复','输入恢复原因',str) then
  try
    with DM.qrytemp do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select [OldSTATUS] from wzcp0493 where rkey = '+
	         '(select max(wzcp0493.rkey) from wzcp0493 where [D492_ptr]= '+DM.ADS492rkey.AsString+')';
      Open;
    end;
    DM.ADOConnection1.BeginTrans;

    DM.ADS492.Edit;
    DM.ADS492TSTATUS.AsInteger := DM.qrytemp.Fields[0].AsInteger;
    DM.ADS492.Post;
    
    DM.ADOCommand1.CommandText :='insert into wzcp0493'+
    '([D492_ptr],[OldSTATUS],[TSTATUS],[Oper_date],[Oper_Empl],[remark]) '+
    'values('+DM.ADS492rkey.AsString+','+DM.ADS492TSTATUS.AsString+',8,getdate(),'+user_ptr+','+QuotedStr(str)+')';
  //  ShowMessage(DM.ADOCommand1.CommandText);
    DM.ADOCommand1.Execute;



    DM.ADOConnection1.CommitTrans;
  except
    DM.ADOConnection1.RollbackTrans;
  end;
end;

procedure TMAIN_Form.btFindClick(Sender: TObject);
begin
  with DM.ADS492 do
  begin
    Close; 
    CommandText := sql_text +#13+ strStatusValue+#13+Fsql  ;
    Open;
  end;
  lblcount.Caption := '当前显示记录行数：'+ IntToStr(dm.ADS492.RecordCount);
end;

procedure TMAIN_Form.BOMClick(Sender: TObject);
var
  ProdBOM_frm: TProdBOM_frm;
  Lsql:string;
begin
 if DM.ADS492.FieldByName('ctrl').AsInteger=1 then
 begin
   ShowMessage('该项目为管控项目,你当前的权限不允许操作该项目.');
   Exit;
 end;

  ProdBOM_frm:= TProdBOM_frm.Create(Application);
  try
    with ProdBOM_frm do
    begin
      cds_wzcp0492.CommandText := cds_wzcp0492.CommandText+#13
        +' where wzcp0492.[D492_ptr] = ' + DM.ADS492.FieldByName('rkey').AsString+#13
        +' order by wzcp0494.part_name,d17_1.INV_PART_NUMBER';
       //ShowMessage(cds_wzcp0492.CommandText);
      cds_wzcp0492.Open;
      ShowModal;
    end;
  finally
    ProdBOM_frm.Free;
  end;   
end;

procedure TMAIN_Form.N4Click(Sender: TObject);
var
  Detailed1_frm: TDetailed1_frm;
begin
 if DM.ADS492.FieldByName('ctrl').AsInteger=1 then
 begin
   ShowMessage('该项目为管控项目,你当前的权限不允许操作该项目.');
   Exit;
 end;


  Detailed1_frm:= TDetailed1_frm.Create(Application);
  try
    Detailed1_frm.ADOQuery1.SQL.Text := Detailed1_frm.ADOQuery1.SQL.Text +
    'where data0492.rkey = '+dm.ADS492rkey.AsString+
    ' order by wzcp0494.part_name ,Data0017.INV_PART_NUMBER';
    with Detailed1_frm.DBGridEh1 do
    begin
      FieldColumns['CUT_NO'].Visible := false;
      FieldColumns['PROD_CODE'].Visible := false;
      FieldColumns['PRODUCT_NAME'].Visible := false;
      FieldColumns['PRODUCT_DESC'].Visible := false;
    end;
    Detailed1_frm.ADOQuery1.Open;
    Detailed1_frm.ShowModal ;
  finally
    Detailed1_frm.Free;
  end;
end;

procedure TMAIN_Form.BitBtn5Click(Sender: TObject);
var
  Detailed1_frm: TDetailed1_frm;
begin
  Detailed1_frm:= TDetailed1_frm.Create(Application);
  try
    Detailed1_frm.ADOQuery1.SQL.Text := Detailed1_frm.ADOQuery1.SQL.Text +
    ' order by Data0008.PROD_CODE,wzcp0494.part_name ,Data0017.INV_PART_NUMBER';

    Detailed1_frm.ADOQuery1.Open;
    Detailed1_frm.WindowState := wsMaximized;
    Detailed1_frm.ShowModal ;
  finally
    Detailed1_frm.Free;
  end;

end;

procedure TMAIN_Form.AddAllBOMClick(Sender: TObject);
//var
//  str:string;
begin       {
  str := '';
  with DM.ADS492 do
  begin
    //检查当前的ADS492中的记录是否都有有效的工程BOM，
    First;
    while not Eof do
    begin
      DM.qrytemp.Close;
      DM.qrytemp.SQL.Text := 'select * from data0140 where data0140.part_ptr = '
      + FieldByName('BOM_PTR').AsString + ' and data0140.status = 1';
      //ShowMessage(DM.qrytemp.SQL.Text);
      DM.qrytemp.Open;
      if DM.qrytemp.IsEmpty  then
      begin
        str := str + '“' + Trim(FieldByName('CUT_NO').AsString)+'”'+#13;
      end;
      Next;
    end; 
    if str <> '' then
    begin
      str := Copy (str,0,Length(str)-1);
      if MessageBox(Handle,pchar('生产单' + str + '无有效的工程BOM，你要继续吗？'),'询问',MB_YESNO+MB_iconquestion+MB_DEFBUTTON2)=IDNO	then
      Exit;
    end;

    First;
    while not Eof do
    begin
      with DM.ADOCommand1 do
      begin
        CommandText := 'if not exists(select rkey from wzcp0492 where [D492_ptr] = '+FieldByName('rkey').AsString +')'
                       +'insert into wzcp0492([D492_ptr],[D017_ptr],[STD_QTY],[App_QTY],[Con_QTY],[QUAN_ASSIGN]) '+#13
                       +'select '+FieldByName('rkey').AsString
                       +',data0148.INVENT_PTR,sum(data0148.QUAN_BOM * '+FieldByName('ISSUED_QTY').AsString+') ,0,0,0'+#13
                       +'from data0140 join data0148 on data0140.rkey = data0148.[PART_PTR]  and data0140.status = 1'+#13
                       +'join data0008 on data0140.part_ptr = data0008.rkey '+#13
                       +'where (data0140.part_ptr = '+FieldByName('BOM_PTR').AsString+') and(dbo.DATA0148.Invent_or = 0)'+#13
                       +'group by data0148.INVENT_PTR,data0008.PROD_CODE order by data0008.PROD_CODE';
       // ShowMessage(CommandText);
        Execute;
      end;
      Next;
    end;
  end;   }
end;

procedure TMAIN_Form.mni_EditPHOurClick(Sender: TObject);
var
  LFrm:TfrmPHourEdit;
  Lsql:string;
begin
   if dm.ADS492.IsEmpty then exit;
   
     LFrm:=TfrmPHourEdit.Create(self);
     LFrm.FPHour:= dm.ADS492.fieldbyname('PHour').AsFloat;
     try
      if Lfrm.ShowModal=mrok then
        begin
        Lsql:='update data0492 set Re_WorkHour='+trim(LFrm.edt_PHour.Text)+' where rkey='+dm.ADS492.fieldbyname('rkey').AsString;
        dm.execsql(DM.qrytemp,Lsql);
        BitBtn3Click(BitBtn3);
        //dm.qrytemp.SQL.Insert();
        end;
     finally
      LFrm.Free;
     end;
end;

procedure TMAIN_Form.RefreshData(rkey:Integer);
begin
  DM.ADS492.Close;
  DM.ADS492.Prepared;
  DM.ADS492.Open;
  DM.ADS492.Locate('rKey',rKey,[]);
end;

procedure TMAIN_Form.N11Click(Sender: TObject);
var dDate:TDateTime;
 row:string;
begin

       if DM.ADS492TSTATUS.AsString > '2' then
        begin
           ShowMessage('不允许修改！请检查生产状态！');
           Exit;
        end
       else
        begin
         if StrToInt(vprev)=4 then
          begin

               row := DM.ADS492SCH_COMPL_DATE.AsString;
               if InputQuery('日期输入', '请输入新的计划完工日期:      ',row)  then  //修正点cancel按钮也保存的BUG
                begin
                    if not TryStrToDate(row,dDate) then
                      begin
                         ShowMessage('日期转换失败，请确定日期格式是yyyy-mm-dd');
                         Exit;
                      end;
                    DM.tmp.Close;
                    dm.tmp.SQL.Clear;
                    dm.tmp.SQL.Text := 'update data0492 set SCH_COMPL_DATE='+QuotedStr(row)+
                    ' where rkey='+ DM.ADS492rkey.AsString;
                    if dm.tmp.ExecSQL >0 then
                     begin
                        try
                           DM.ADOConnection1.BeginTrans;

                           DM.ADOCommand1.CommandText :='insert into wzcp0493'+
                            '([D492_ptr],[OldSTATUS],[TSTATUS],[Oper_date],[Oper_Empl],[remark]) '+
                            ' values('+DM.ADS492rkey.AsString+','+DM.ADS492TSTATUS.AsString+','+DM.ADS492TSTATUS.AsString+',getdate(),'+user_ptr+','+  QuotedStr(DM.ADS492SCH_COMPL_DATE.AsString+' , '+ row)+')';
                           DM.ADOCommand1.Execute;

                           DM.ADS492.Edit;
                           DM.ADS492TSTATUS.AsInteger := 5;
                           DM.ADS492.Post;

                           DM.ADOConnection1.CommitTrans;
                        except
                          DM.ADOConnection1.RollbackTrans;
                        end;

                        showmsg('保存成功',1);
                        RefreshData(DM.ADS492rkey.Value);

                     end
                    else
                     begin
                         showmsg('保存失败,请与管理员系联',1);
                     end;
                end;
          end
         else
            begin
               showmsg('权限不足！需要开通最高权限4',1);
               Exit;
            end;
        end;
end;

end.

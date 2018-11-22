unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ADODB,
  ppEndUsr, ppReport, ppSubRpt, ppBands, ppStrtch, ppMemo, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppComm, ppRelatv, ppDB, ppDBPipe,
  DBCtrlsEh, DBCtrls, Mask, ComCtrls;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtQry: TBitBtn;
    Edit1: TEdit;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Grd2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    BitBtn6: TBitBtn;
    ppDB60: TppDBPipeline;
    ppDB63: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    N2: TMenuItem;
    ppTitleBand1: TppTitleBand;
    ppDBText8: TppDBText;
    ppLabel1: TppLabel;
    ppDBText9: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText10: TppDBText;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLine7: TppLine;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppDBText15: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppDBText11: TppDBText;
    ppLabel15: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel17: TppLabel;
    ppLine6: TppLine;
    ppLine11: TppLine;
    ppDBText6: TppDBText;
    ppDBText14: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppLine2: TppLine;
    ppLine5: TppLine;
    ppDBText16: TppDBText;
    GroupBox2: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Grd1: TDBGridEh;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    N3: TMenuItem;
    Label4: TLabel;
    DBEdit14: TDBEdit;
    DBText3: TDBText;
    N4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsCheck,FsSearch:string;
    procedure init;
  public

  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,DM_u,Frm_QrySet_u;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
 {}if not App_Init(dm.ADOCon ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title; 


//dm.ADOCon.Open;
//user_ptr := '3';
//vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
end;

procedure TFrm_main.BtCloseClick(Sender: TObject);
begin
  Frm_QrySet.Free;
  close;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
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

procedure TFrm_main.BtBrushClick(Sender: TObject);
var
  i:integer;
begin
  if DM.ADO60.IsEmpty then exit;
  i := DM.ADO60rkey.AsInteger ;
  DM.ADO60.Close;
  DM.ADO60.Open;
  DM.ADO60.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO60.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO60.Sort:=Column.FieldName+' DESC';
  end;
  DM.ADO60AfterScroll(DM.ADO60);
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

procedure TFrm_main.init;
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
  sSql:=DM.ADO60.SQL.Text;
  FsSearch:=' where wzcp0060.sales_date>getdate()-14 ';
  CheckBox1Click(nil);
end;

procedure TFrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.ADO60status.Value = 5 then
     Grd1.Canvas.Font.Color := clred
  else if dm.ADO60status.Value = 2 then
     Grd1.Canvas.Font.Color := clTeal //cllime
  else if dm.ADO60status.Value = 1 then
     Grd1.Canvas.Font.Color := clfuchsia
  else if dm.ADO60status.Value = 4 then
     Grd1.Canvas.Font.Color := clGreen ;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=not DM.ADO60.IsEmpty and (dm.ADO60status.AsInteger=2);
  N2.Enabled:=not DM.ADO60.IsEmpty and (dm.ADO60status.AsInteger=3);
  N3.Enabled:=N1.Enabled;
//  N4.Enabled := not N1.Enabled;
  N4.Enabled :=not DM.ADO60.IsEmpty and (dm.ADO60status.AsInteger=3);
end;

procedure TFrm_main.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];
    FsSearch:=' where wzcp0060.sales_date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
              ''' and wzcp0060.sales_date-1<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr;
    CheckBox1Click(nil);
  end;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO60.SQL.Text);
end;

procedure TFrm_main.N1Click(Sender: TObject);
var
  i: integer;
  rkey492: string;
begin
  if (vprev='1') or (vprev='3') then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;

  case Tmenuitem(Sender).Tag of
   0:try
       DM.ADOCon.BeginTrans;
       DM.tmp.Close;
       DM.tmp.SQL.Text := 'select data0492.rkey from data0492 inner join wzcp0070 on data0492.SO_NO=wzcp0070.sales_order'
         + ' where wzcp0070.rkey = ' + quotedstr(DM.ADO60rkey70.AsString);
       DM.tmp.Open;
       if not DM.tmp.IsEmpty then
       begin
         rkey492 := DM.tmp.FieldByName('rkey').AsString;
         DM.tmp.SQL.Text := 'update wzcp0060 set status=3, mo_ptr= ' + rkey492 + ', conf_by_empl_ptr='+user_ptr+',conf_date=getdate() where rkey='+DM.ADO60rkey.AsString+' and status=2';
       end
       else
       begin
         DM.tmp.SQL.Text := 'update wzcp0060 set status=3, conf_by_empl_ptr='+user_ptr+',conf_date=getdate() where rkey='+DM.ADO60rkey.AsString+' and status=2' ;
         DM.tmp.Close;
       end;
       if DM.tmp.ExecSQL=0 then
       begin
         DM.ADOCon.RollbackTrans;
         showmessage('出库单状态发生改变而未能成功提交!');
         exit;
       end;

       DM.tmp.SQL.Text:='select prod_ptr from wzcp0063 where so_ptr='+DM.ADO60rkey.AsString+'  group by prod_ptr';
       DM.tmp.Open;
       i:=DM.tmp.RecordCount;

       DM.tmp.Close;
       DM.tmp.SQL.Text:='update data0008 set qty_onhand=qty_onhand-B.quantity '+
                        'from data0008 A inner join '+
                        '(select prod_ptr,sum(quantity) quantity from wzcp0063 where so_ptr='+DM.ADO60rkey.AsString+'  group by prod_ptr) B on A.rkey=B.prod_ptr '+
                        'and A.qty_onhand>=B.quantity ';
       if DM.tmp.ExecSQL<>i then
       begin
         DM.ADOCon.RollbackTrans;
         showmessage('库存不足而未能成功提交!');
         exit;
       end;

       DM.tmp.SQL.Text:='update wzcp0001 set qty_on_hand=qty_on_hand-B.quantity '+
                        ' from wzcp0001 A inner join wzcp0063 B on A.proc_ptr=B.prod_ptr '+
                        ' and A.location_ptr=B.location_ptr and A.qty_on_hand>=B.quantity '+
                        ' where B.so_ptr='+DM.ADO60rkey.AsString ;
       if DM.tmp.ExecSQL<>DM.ADO63.RecordCount then
       begin
         DM.ADOCon.RollbackTrans;
         showmessage('出库单状态发生改变或库存不足而未能成功提交!');
         exit;
       end;

       if DM.ADO60type.AsInteger=1 then
       begin
         DM.tmp.SQL.Text:='select rkey from wzcp0070 where rkey='+DM.ADO60rkey70.AsString+' and status in (3,4) and type=1';
         DM.tmp.Open;
         if DM.tmp.IsEmpty then
         begin
           DM.ADOCon.RollbackTrans;
           showmessage('订单状态发生改变而未能成功提交!');
           exit;
         end;
         DM.tmp.Close;
         DM.tmp.SQL.Text:='update wzcp0071 set parts_shipped=parts_shipped+B.quantity '+
                          ' from wzcp0071 A inner join (select prod_ptr,sum(quantity) quantity from wzcp0063 where so_ptr='+DM.ADO60rkey.AsString+' group by prod_ptr) '+
                          ' B on A.prod_ptr=B.prod_ptr '+
                          ' and A.quantity>=A.parts_shipped+B.quantity and A.so_ptr='+DM.ADO60rkey70.AsString;
         if DM.tmp.ExecSQL<>i then
         begin
           DM.ADOCon.RollbackTrans;
           showmessage('订单状态发生改变而未能成功提交!');
           exit;
         end;

         DM.tmp.SQL.Text:='update wzcp0070 set status=5 '+
                          ' where rkey='+DM.ADO60rkey70.AsString+' and status in (3, 4) and type=1 and '+
                          ' not exists(select rkey from wzcp0071 where so_ptr='+DM.ADO60rkey70.AsString+' and quantity>parts_shipped)';
         DM.tmp.ExecSQL;
       end;
       DM.ADOCon.CommitTrans;
       showmessage('审核出仓成功!');
       BtBrushClick(nil);
     except
       on e:exception do
       begin
         DM.ADOCon.RollbackTrans;
         showmessage('审核出仓发生错误:'+e.Message+',审核失败...');
       end;
     end;

   1:begin
      ppReport1.Reset;
      ppReport1.Template.FileName:=stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+'RepSBcp60.rtm.rtm';
      ppReport1.Template.LoadFromFile;
      ppReport1.SaveAsTemplate:=false;
      ppReport1.Print;
     end;

   2:begin
       DM.tmp.Close;
       DM.tmp.SQL.Text:='update wzcp0060 set status=5,conf_by_empl_ptr=null,conf_date=null where rkey='+DM.ADO60rkey.AsString+' and status=2' ;
       if DM.tmp.ExecSQL=0 then
         showmessage('出库单状态发生改变而未能成功退回!');
       BtBrushClick(nil);
     end;
  end;
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

procedure TFrm_main.CheckBox1Click(Sender: TObject);
var i:integer;
    stype:string;
begin
  FsCheck:=' and wzcp0060.status in (-1,';
  for i:=0 to GroupBox1.ControlCount-1 do
  begin
    if GroupBox1.Controls[i] is  TCheckBox then
      if TCheckBox(GroupBox1.Controls[i]).Checked then FsCheck:=FsCheck+inttostr(GroupBox1.Controls[i].Tag)+',';
  end;
  FsCheck:=FsCheck+'-2) ';
  if RadioButton1.Checked then
    stype:=' and wzcp0060.type=1 '
  else
    stype:=' and wzcp0060.type=2 ';
  DM.ADO60.SQL.Text:=sSql+FsSearch+FsCheck+stype+' order by wzcp0060.sales_order';
  DM.ADO60.Close;
  DM.ADO60.Open;

end;

procedure TFrm_main.BitBtn6Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    exit;
  end;

  ppReport1.Reset;
  ppReport1.Template.FileName := stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+'RepSBcp60.rtm.rtm';
  ppReport1.Template.LoadFromFile;
  ppReport1.SaveAsTemplate:=true;
  ppdesigner1.ShowModal;
end;

procedure TFrm_main.RadioButton1Click(Sender: TObject);
var i:integer;
begin
  PageControl1.ActivePageIndex:=0;
  if RadioButton1.Checked then
  begin
    for i:=4 to 14 do  Grd1.Columns[i].Visible:=true;
    Grd2.Columns[4].Visible:=true;
    Grd2.Columns[5].Visible:=true;
    TabSheet2.TabVisible:=true;
  end else begin
    for i:=4 to 14 do  Grd1.Columns[i].Visible:=false;
    Grd2.Columns[4].Visible:=false;
    Grd2.Columns[5].Visible:=false;
    TabSheet2.TabVisible:=false;
  end;
  CheckBox1Click(nil);
 
end;

procedure TFrm_main.N4Click(Sender: TObject);
var
  EndDate : TDateTime;
  i: Integer;
begin
  if (vprev='1') or (vprev='3') then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;

  if DM.ADO60status.Value = 4 then
  begin
    ShowMessage('此出仓单号已做入账处理，无法取消审核！');
    Exit;
  end;

  if dm.ADO60.IsEmpty then Exit;
  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select top 1 * from data0444 order by rkey desc';
    Open;
    if not IsEmpty then
    begin
      EndDate := FieldValues['FG_DATE'];
      if DM.ADO60CONF_DATE.Value <= EndDate then
      begin
        ShowMessage('审核日期小于最新一次截数日期，无法取消审核！');
        Exit;
      end;
    end;
  end;
  if MessageDlg('确定要反审您选中的记录吗？', mtInformation, [mbYes, mbNo], 1) = mrNo then Exit;
  try
    DM.ADOCon.BeginTrans;
    DM.tmp.Close;
    DM.tmp.SQL.Clear;
    DM.tmp.SQL.Text:='update wzcp0060 set status=2, conf_by_empl_ptr=null, conf_date=null where rkey='+DM.ADO60rkey.AsString +' and status=3' ;
        if DM.tmp.ExecSQL=0 then
          showmessage('出库单状态发生改变而未能成功退回1!');

    DM.tmp.SQL.Text:='select prod_ptr from wzcp0063 where so_ptr='+DM.ADO60rkey.AsString+'  group by prod_ptr';
    DM.tmp.Open;
    i:=DM.tmp.RecordCount;

    DM.tmp.Close;
    DM.tmp.SQL.Text:='update data0008 set qty_onhand=qty_onhand+B.quantity '+
                  'from data0008 A inner join '+
                  '(select prod_ptr,sum(quantity) quantity from wzcp0063 where so_ptr='
                  +DM.ADO60rkey.AsString+'  group by prod_ptr) B on A.rkey=B.prod_ptr';

    if DM.tmp.ExecSQL<>i then
    begin
      DM.ADOCon.RollbackTrans;
      showmessage('库存不足而未能成功提交!2');
      exit;
    end;


    DM.tmp.SQL.Text:='update wzcp0001 set qty_on_hand=qty_on_hand+B.quantity '+
                  ' from wzcp0001 A inner join wzcp0063 B on A.proc_ptr=B.prod_ptr '+
                  ' and A.location_ptr=B.location_ptr '+
                  ' where B.so_ptr='+DM.ADO60rkey.AsString ;
    if DM.tmp.ExecSQL<>DM.ADO63.RecordCount then
    begin
      DM.ADOCon.RollbackTrans;
      showmessage('出库单状态发生改变或库存不足而未能成功提交!3');
      exit;
    end;

     //ShowMessage(IntToStr(DM.ADO60type.AsInteger));   // 直接出仓的时候这个值是2

    if DM.ADO60type.AsInteger=1 then  // 销售出仓的时候这个值是1
    begin
     { DM.tmp.SQL.Text := 'select rkey from wzcp0070 where rkey='+DM.ADO60rkey70.AsString+' and status=5 and type=1';
      DM.tmp.Open;
      if not DM.tmp.IsEmpty then //20150811tang修改为状态已完成不能取消审核，否则可返审
      begin
       DM.ADOCon.RollbackTrans;
       showmessage('订单状态发生改变而未能成功提交!4');
       exit;
      end;}

      DM.tmp.SQL.Text := 'select data0492.rkey from data0492 inner join wzcp0070 on data0492.SO_NO=wzcp0070.sales_order where wzcp0070.rkey ='+DM.ADO60rkey70.AsString+' and wzcp0070.type=1 ';
      DM.tmp.Open;
      if not DM.tmp.IsEmpty then //20170224luo状态是否投产，是状态改为4 否为3
       begin
          DM.tmp.SQL.Text:='update wzcp0070 set status=4 where rkey='+DM.ADO60rkey70.AsString+' and type=1';
          DM.tmp.ExecSQL;
       end
      else
       begin
          DM.tmp.SQL.Text:='update wzcp0070 set status=3 where rkey='+DM.ADO60rkey70.AsString+' and type=1';
          DM.tmp.ExecSQL;
       end;

      DM.tmp.Close;
      DM.tmp.SQL.Text:='update wzcp0071 set parts_shipped=parts_shipped-B.quantity '+
                      'from wzcp0071 A inner join (select prod_ptr,sum(quantity) quantity from wzcp0063 where so_ptr='+DM.ADO60rkey.AsString+' group by prod_ptr) '+
                      'B on A.prod_ptr=B.prod_ptr '+
                      'and A.so_ptr='+DM.ADO60rkey70.AsString;
      if DM.tmp.ExecSQL<>i then
      begin
       DM.ADOCon.RollbackTrans;
       showmessage('订单状态发生改变而未能成功提交!5');
       exit;
      end;
//20150811注-----
//      DM.tmp.SQL.Text:='update wzcp0070 set status=3 '+
//                      'where rkey='+DM.ADO60rkey70.AsString+' and status=5 and type=1 '+
//                      'and rkey='+DM.ADO60rkey70.AsString ;
//      DM.tmp.ExecSQL;
//end 20150811注-----

    end;
      DM.ADOCon.CommitTrans;
      showmessage('取消审核成功!');
      BtBrushClick(nil);
    //end;
  except
    on e:exception do
    begin
     DM.ADOCon.RollbackTrans;
     showmessage('取消审核发生错误:'+e.Message+',审核失败...');
    end;
  end;
end;

end.

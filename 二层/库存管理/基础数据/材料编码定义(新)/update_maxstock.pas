unit update_maxstock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  Tfrm_updatemaxstock = class(TForm)
    ComboBox1: TComboBox;
    Label10: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    Bevel1: TBevel;
    DTpk1: TDateTimePicker;
    DTpk2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel2: TBevel;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    ProgressBar1: TProgressBar;
    Label4: TLabel;
    Label7: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_updatemaxstock: Tfrm_updatemaxstock;

implementation

uses Pick_Item_Single,ConstVar , damo,common, maxstock;

{$R *.dfm}

procedure Tfrm_updatemaxstock.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  try
//    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
//    InputVar.Fields := 'INV_PART_NUMBER/材料编码/180,inv_name/材料名称/180,inv_description/材料规格/250';
//    InputVar.Sqlstr := 'select  RKEY ,INV_PART_NUMBER,inv_name,inv_description from data0017 ORDER by INV_PART_NUMBER';
//    Inputvar.KeyField:='';
//    InputVar.AdoConn := dm.ADOConnection1 ;
//    frmPick_Item_Single.InitForm_New(InputVar);
//    if frmPick_Item_Single.ShowModal=mrok then
//    begin
//      edit2.Text:=frmPick_Item_Single.adsPick.fieldbyname('INV_PART_NUMBER').AsString;
//      Edit2.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
//      Label9.Caption := frmPick_Item_Single.adsPick.FieldByName('inv_name').value;
//
//    end;
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields := 'GROUP_NAME/材料类别代码/150,GROUP_DESC/材料类别描述/150,type/类别/180';
    InputVar.Sqlstr := 'select  rkey,GROUP_NAME,GROUP_DESC,case ttype when ''P'' then ''直接材料'' when ''M'' then ''间接材料'' end as type from data0496 order by GROUP_NAME';
    Inputvar.KeyField:='';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit2.Text:=frmPick_Item_Single.adsPick.fieldbyname('GROUP_NAME').AsString;
      Edit2.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
      Label9.Caption := frmPick_Item_Single.adsPick.FieldByName('GROUP_DESC').value;
    end;
  finally
    frmPick_Item_Single.Free;
  end

end;

procedure Tfrm_updatemaxstock.BitBtn2Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  try
    frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
    InputVar.Fields := 'GROUP_NAME/材料类别代码/150,GROUP_DESC/材料类别描述/150,type/类别/180';
    InputVar.Sqlstr := 'select  rkey,GROUP_NAME,GROUP_DESC,case ttype when ''P'' then ''直接材料'' when ''M'' then ''间接材料'' end as type from data0496 order by GROUP_NAME';
    Inputvar.KeyField:='';
    InputVar.AdoConn := dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit3.Text:=frmPick_Item_Single.adsPick.fieldbyname('GROUP_NAME').AsString;
      Edit3.Tag:= frmPick_Item_Single.adsPick.fieldbyname('rkey').asinteger;
      Label11.Caption := frmPick_Item_Single.adsPick.FieldByName('GROUP_DESC').value;

    end;
  finally
    frmPick_Item_Single.Free;
  end

end;

procedure Tfrm_updatemaxstock.BitBtn4Click(Sender: TObject);
begin
  if dtpk2.Date<dtpk1.Date then
  begin
   messagedlg('日期范围设置不正确!',mtinformation,[mbok],0);
   dtpk2.SetFocus;
   exit;
  end;
  if (trim(edit2.Text)='') or (trim(edit3.Text)='') then
  begin
   messagedlg('原材料范围不能为空!',mtinformation,[mbok],0);
   edit2.SetFocus;
   exit;
  end;
  if edit3.Text<edit2.Text then
  begin
   messagedlg('结束原材料不能小于开始原材料!',mtinformation,[mbok],0);
   edit3.SetFocus;
   exit;
  end;

  if ComboBox1.ItemIndex=1 then
  begin
    with ADOQuery3 do
    begin
      Close;
      SQL.Text :='if exists (select * from tempdb.dbo.sysobjects where id = object_id(N''tempdb..#a17'') and type=''U'')'
        + #13#10 + 'DROP TABLE [dbo].[#a17]';
      ExecSQL;
    end;
    with ADOQuery1 do
    begin
      Close;
      SQL.Text :='SELECT  ceiling( SUM(dbo.Data0071.QUAN_ORD)/(datediff(month,'''+FormatDateTime('yyyy-MM-dd',dtpk1.date)+''','''+
                 FormatDateTime('yyyy-MM-dd',dtpk2.date)+''')+1)*'+edit4.Text+'/100) AS quan_or,Data0017.REPORT_VALUE2, dbo.Data0071.INVT_PTR'+
                 ' into #a17'+
                 ' FROM dbo.Data0071 INNER JOIN ' +
                 ' dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.RKEY INNER JOIN'+
                 ' dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY inner join'+
                 ' dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY' +
                 ' where Data0070.PO_DATE>='''+ (FormatDateTime('yyyy-MM',dtpk1.date)+'-01')+''' and Data0070.PO_DATE< dateadd(month,1,'''+
                  (FormatDateTime('yyyy-MM',dtpk2.date)+'-01')+''') and Data0496.GROUP_NAME>='+ QuotedStr(edit2.Text)+
                  ' and Data0496.GROUP_NAME<='+ QuotedStr(edit3.Text)+' GROUP BY dbo.Data0071.INVT_PTR,Data0017.REPORT_VALUE2';
//     ShowMessage(SQL.Text);
      if ExecSQL>0 then
      begin

        frm_maxstock := Tfrm_maxstock.Create(Application);
        frm_maxstock.cbindex :=1;
        if frm_maxstock.ShowModal=mrok then
//        with ADOQuery2 do
//        begin
//          Close;
//          SQL.Text := 'drop table #a17' ;
//          ExecSQL;
//        end;
//        ModalResult := mrOk;
      end
      else
      begin
        ShowMessage('所选材料在所选时间段内无订购记录');
        Exit;
      end;
    end;

  end
  else  if  ComboBox1.ItemIndex=0 then
  begin
    with ADOQuery3 do
    begin
      Close;
      SQL.Text :='if exists (select * from tempdb.dbo.sysobjects where id = object_id(N''tempdb..#a017'') and type=''U'')'
        + #13#10 + 'DROP TABLE [dbo].[#a017]';
      ExecSQL;
    end;
//    ShowMessage('q');
    with ADOQuery1 do
    begin
      Close;
      SQL.Text :='SELECT    ceiling( SUM(dbo.Data0207.QUANTITY)/(datediff(month,'''+FormatDateTime('yyyy-MM-dd',dtpk1.date)+''','''+
                 FormatDateTime('yyyy-MM-dd',dtpk2.date)+''')+1)*'+edit4.Text+'/100) AS quantit, dbo.Data0207.INVENTORY_PTR, dbo.Data0017.REPORT_VALUE2 '+
        ' into #a017'+
         ' FROM  dbo.Data0017 INNER JOIN' +
        '  dbo.Data0207 ON dbo.Data0017.RKEY = dbo.Data0207.INVENTORY_PTR inner join'+
        ' dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY' +
         ' where Data0207.TDATE>='''+ (FormatDateTime('yyyy-MM',dtpk1.date)+'-01')+''' and Data0207.TDATE< dateadd(month,1,'''+
        (FormatDateTime('yyyy-MM',dtpk2.date)+'-01')+''') and Data0496.GROUP_NAME>='+ QuotedStr(edit2.Text)+
        ' and Data0496.GROUP_NAME<='+ QuotedStr(edit3.Text)+                      
        ' GROUP BY dbo.Data0207.INVENTORY_PTR, dbo.Data0017.REPORT_VALUE2';
//       ShowMessage(SQL.Text);
      if ExecSQL>0 then
      begin
        frm_maxstock := Tfrm_maxstock.Create(Application);
        frm_maxstock.cbindex:=0;
        if frm_maxstock.ShowModal=mrok then
//        with ADOQuery2 do
//        begin
//          Close;
//          SQL.Text := 'drop table #a017' ;
//          ExecSQL;
//        end;

      end
      else
      begin
        ShowMessage('所选材料在所选时间段内无发料记录');
        Exit;
      end;


    end;
  end;

   ModalResult := mrOk;
end;

procedure Tfrm_updatemaxstock.FormActivate(Sender: TObject);
begin
//    DTpk1.Date :=Get_Month_First_Day(IncMonth(now,-3));
//    DTpk2.Date := Get_Month_First_Day(IncMonth(now));
  with ADOQuery1 do
  begin
    Close;
    SQL.Text := 'select dateadd(month,-3,'''+ FormatDateTime('yyyy-MM-dd',common.getsystem_date(ADOQuery2,0))+''') as month';
    Open;
  end;
  DTpk1.Date := Get_Month_First_Day(ADOQuery1.FieldByName('month').AsDateTime);
  with ADOQuery1 do
  begin
    Close;
    SQL.Text := 'select dateadd(month,-1,'''+ FormatDateTime('yyyy-MM-dd',common.getsystem_date(ADOQuery2,0))+''') as month';
    Open;
  end;
  DTpk2.Date := Get_Month_First_Day(ADOQuery1.FieldByName('month').AsDateTime);
end;

procedure Tfrm_updatemaxstock.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex =0 then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Text := 'select dateadd(month,-3,'''+ FormatDateTime('yyyy-MM-dd',common.getsystem_date(ADOQuery2,0))+''') as month';
      Open;
    end;
    DTpk1.Date := Get_Month_First_Day(ADOQuery1.FieldByName('month').AsDateTime);
//    DTpk1.Date :=Get_Month_First_Day(IncMonth(now,-3));
//    DTpk2.Date := Get_Month_First_Day(IncMonth(now));
    with ADOQuery1 do
    begin
      Close;
      SQL.Text := 'select dateadd(month,-1,'''+ FormatDateTime('yyyy-MM-dd',common.getsystem_date(ADOQuery2,0))+''') as month';
      Open;
    end;
    DTpk2.Date := Get_Month_First_Day(ADOQuery1.FieldByName('month').AsDateTime);

    Edit4.Text :='75';
  end
  else
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Text := 'select dateadd(month,-1,'''+ FormatDateTime('yyyy-MM-dd', common.getsystem_date(ADOQuery2,0))+''') as month';
      Open;
    end;
    DTpk1.Date := Get_Month_First_Day(ADOQuery1.FieldByName('month').AsDateTime);
    DTpk2.Date := Get_Month_First_Day(ADOQuery1.FieldByName('month').AsDateTime);
//    DTpk1.Date :=Get_Month_First_Day(Now)-1;
//    DTpk2.Date := Get_Month_First_Day(Now)-1;
    Edit4.Text :='65';
  end;
end;

end.

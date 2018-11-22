unit Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Buttons, ExtCtrls, Menus, ComCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    eh1: TDBGridEh;
    BitBtn5: TBitBtn;
    PM1: TPopupMenu;
    PM2: TPopupMenu;
    N1: TMenuItem;
    BitBtn6: TBitBtn;
    N2: TMenuItem;
    N3: TMenuItem;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure eh1TitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure eh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PM1Popup(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    strStatusValue,sql_text : string;
    PreColumn:TColumnEh;
    procedure item_click(sender: TObject);

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DM,common,DB, FM_Condition, Frm_Shipping, FM_report;

{$R *.dfm}
//加载
procedure TForm1.FormCreate(Sender: TObject);
begin
  {}if not App_init_2(F_DM.ADOConnection1) then
    begin
      showmsg('程序起动失败请联系管理员!',1);
      application.Terminate;
      exit;
    end;
    self.Caption:=application.Title;

   sql_text:=F_DM.ADS22.CommandText;

 //rkey73:='259';
 //user_ptr := '626';
 //vprev := '4'
end;




procedure TForm1.item_click(sender: Tobject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  for i := 0 to eh1.FieldCount - 1 do
  if eh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
  begin
    if (sender as tmenuItem).Checked then
    begin
      eh1.Columns[i].Visible := true;
      break;
    end
    else
    begin
      eh1.Columns[i].Visible := false;
      break;
    end;
  end;
end;



//退出
procedure TForm1.BitBtn1Click(Sender: TObject);
begin
    Application.Terminate;
end;
//搜索
procedure TForm1.Edit1Change(Sender: TObject);
begin
   if trim(Edit1.text)<>'' then
    eh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    eh1.DataSource.DataSet.Filter:='';

end;
 //
procedure TForm1.eh1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker = smDownEh) or (column.Title.SortMarker = smNoneEh) then
  begin
    column.Title.SortMarker := smUpEh;
    F_DM.ADS22.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    F_DM.ADS22.IndexFieldNames:=Column.FieldName+' DESC';
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
  else
  edit1.SetFocus;
end;
//显示
procedure TForm1.eh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='V') and (ssalt in shift) then
    showmessage(F_DM.ADS22.CommandText);
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i:Integer;
  item:TMenuItem;
begin

  PreColumn := eh1.Columns[0];
  for i:=1 to eh1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := eh1.Columns[i-1].Title.Caption ;
    item.Checked := eh1.Columns[i-1].Visible ;
    item.OnClick := item_click ;
    self.PM2.Items.Add(item) ;
  end;
  sql_text := F_DM.ADS22.CommandText;
  strStatusValue :=' and (dbo.Data0096.status in (0)) ';
  With F_DM.ADS22 do
    begin
      Close;
       
      CommandText := sql_text+strStatusValue;
      F_DM.ADS22.Parameters.ParamByName('dtpk1').Value := DateToStr(common.getsystem_date(f_dm.ADOQuery1,0)-90);
      F_DM.ADS22.Parameters.ParamByName('dtpk2').Value := DateToStr(common.getsystem_date(f_dm.ADOQuery1,0)+1);
      Open;
    end;

end;
 //导出
procedure TForm1.BitBtn5Click(Sender: TObject);
begin

    if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) = mryes then
     common.Export_dbGridEH_to_Excel(eh1,'execl');
     
end;
//刷新
procedure TForm1.BitBtn2Click(Sender: TObject);
var
   rkey22 : Integer;
begin
    if F_DM.ADS22.Active then
      begin
        rkey22 := F_DM.ADS22RKEY.Value;
        F_DM.ADS22.Close;
        F_DM.ADS22.Open;
        if rkey22 >0 then
         F_DM.ADS22.Locate('rkey',rkey22,[]);
      end;

end;
//字段
procedure TForm1.BitBtn4Click(Sender: TObject);
begin
    PM2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;
//查询
procedure TForm1.BitBtn3Click(Sender: TObject);
var i:byte;
begin
      if Condition.ShowModal = mrok then
       with F_DM.ADS22 do
         begin
            Close;
            CommandText := sql_text;
            for i :=1 to Condition.SGrid1.RowCount -1 do
             CommandText := CommandText + Condition.SGrid1.Cells[2,i];
             if RadioGroup1.ItemIndex =2 then
               begin
                  CommandText := CommandText +  ' and (dbo.Data0096.status in (0,1)) '  ;
               end
             else
               begin
                 CommandText := CommandText +  ' and (dbo.Data0096.status in ('+inttostr(RadioGroup1.ItemIndex)+')) ' ;
               end;
             // ShowMessage(CommandText);
             Parameters.ParamByName('dtpk1').Value := Condition.dtpk1.Date ;  //quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySet.DateTimePicker1.Date))
             Parameters.ParamByName('dtpk2').Value := Condition.dtpk2.Date + 1 ;
             Open;
         end;
         

end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin

    try
      Form_report := TForm_report.Create(Application);
      Form_report.ppReport1.Reset;
      Form_report.ppReport1.Template.FileName :=
      stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'returen_supp_WZ.rtm';
      Form_report.ppReport1.Template.LoadFromFile;
      Form_report.ppReport1.SaveAsTemplate := True;
      Form_report.ppDesigner1.ShowModal;
    finally
      Form_report.Free;
    end; 
end;

procedure TForm1.N1Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
   messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
 else
   F_Shipping :=TF_Shipping.Create(Application);
   if F_Shipping.ShowModal = mrok then
    begin
      BitBtn2Click(Sender);
      ShowMessage('退货装运成功');
    end;
   F_Shipping.Free;
end;



procedure TForm1.N2Click(Sender: TObject);
var sit:string;
begin
    if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
      messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
    else
      if MessageDlg('确定取消退货吗?',mtconfirmation,[mbyes,mbno],0) = mryes then
        begin
          F_DM.ADOConnection1.BeginTrans;
          try
            F_DM.ADS22.Edit;
            sit := F_DM.ADS22QUAN_REJD.AsString;
            F_DM.ADS22QUAN_ON_HAND.Value :=F_DM.ADS22QUAN_ON_HAND.Value + F_DM.ADS22QUAN_REJD.Value;
//            F_DM.ADS22QUAN_REJD.Value := 0;
            F_DM.ADS22QUAN_TO_BE_SHIPPED.Value := F_DM.ADS22QUAN_TO_BE_SHIPPED.Value - F_DM.ADS22QUAN_REJD.Value;
            F_DM.ADS22.Post;

            F_DM.ADOQuery1.Close;
            F_DM.ADOQuery1.SQL.Text := 'update data0017 set quan_on_hand=quan_on_hand+'+sit+
                                       ' where rkey='+ F_DM.ADS22key17.AsString;
            F_DM.ADOQuery1.ExecSQL;

            F_DM.ADOQuery1.Close;
            F_DM.ADOQuery1.SQL.Text :='delete data0096  where rkey='+ F_DM.ADS22rkey96.AsString+' ';// and isnull(status,0)=0 and flag=2
            F_DM.ADOQuery1.ExecSQL;

            F_DM.ADOConnection1.CommitTrans;
            ShowMessage('取消退货成功!');
            F_DM.ADO96.Close;
            F_DM.ADO96.Open;

            BitBtn2Click(Sender);
          except
            on e:Exception do
             begin
                 F_DM.ADOConnection1.RollbackTrans;
                 ShowMessage('更新错误,取消退货状态发生变化!');
                 F_DM.ADS22.Close;
                 F_DM.ADS22.Open;
                 Exit;
             end;
          end;          

        end;
       
end;


procedure TForm1.N3Click(Sender: TObject);
begin
    if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
      messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
    else
      try
         form_report:=tform_report.Create(application);
         form_report.ADO22.Close;
         form_report.ADO22.Parameters[0].Value:=F_DM.ADS22RKEY.Value;
         form_report.ADO22.Open;

         form_report.ADO95.Close;
         form_report.ADO95.Parameters[0].Value:=F_DM.ADS22rkey96.Value;
         form_report.ADO95.Open;

        // form_report.ppReport1.Reset;

         form_report.ppReport1.Reset;
         form_report.ppReport1.Template.FileName :=
           stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
              'returen_supp_WZ.rtm';
         form_report.ppReport1.Template.LoadFromFile;
         form_report.ppReport1.SaveAsTemplate:=false;
         form_report.ppReport1.Print;
      finally
         form_report.free;
      end;

end;

procedure TForm1.PM1Popup(Sender: TObject);
begin
  if eh1.DataSource.DataSet.FieldByName('v_state').AsString = '未装运' then
    begin
      N1.Enabled := True;
      N2.Enabled := True;
      N3.Enabled := false;
    end
  else
    begin
        N1.Enabled := false;
        N2.Enabled := false;
        N3.Enabled := True;

    end;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
var i:byte;
begin
     strStatusValue := '';

     if RadioGroup1.ItemIndex = 0 then
       strStatusValue := '0'
     else
      if RadioGroup1.ItemIndex = 1 then
       strStatusValue := '1'
     else
       strStatusValue := strStatusValue +'0,1';

     with F_DM.ADS22 do
       begin
         Close;
         CommandText := sql_text;
         for i :=1 to Condition.SGrid1.RowCount -1 do
           CommandText := CommandText + Condition.SGrid1.Cells[2,i];


         CommandText := CommandText + ' and (dbo.Data0096.status in ('+strStatusValue+'))' ;
         Open;
       end;

end;

end.




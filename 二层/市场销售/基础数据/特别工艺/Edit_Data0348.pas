   {***所用到的表：
        data00438:报价产品额外费用分类表(主)
        data0430：报价产品额外费用使用参数表（从表）
        data0278:工程参数明细表 (查询和保存明细表用来比较所用)
        data0002: 计算单位表（查询所用）
   上述表层次由上到下 ********/  }

unit Edit_Data0348;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, QuickRpt, QRCtrls, Buttons,
  DB, ADODB, Grids, DBGrids;

type
  TfrmEdit_Data0348 = class(TForm)
    DBEdit1: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Label1: TLabel;
    btnSave: TButton;
    btnCancel: TButton;
    Label4: TLabel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    Label6: TLabel;
    Combobox3: TComboBox;
    SpeedButton15: TSpeedButton;
    adsUpdate_Sub: TADODataSet;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TDBMemo;
    Memo2: TDBMemo;
    Memo3: TDBMemo;
    ADOQuery1: TADOQuery;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    dsParamList: TDataSource;
    adsParamList: TADODataSet;
    DBCheckBox1: TDBCheckBox;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Combobox3Change(Sender: TObject);
    procedure DBRadioGroup1Change(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
  private
    { Private declarations }
    Run_Mode:byte;
    procedure Set_Run_Mode;//设置窗体各编辑框的模式的
    function Check_Data_Before_Post:boolean;//保存前验证数据完整性
    procedure InitForm;//窗口初始化
    function Update_Eng_Param:boolean;//更新工程参数中间表data430
  public
    { Public declarations }
    procedure Enter(EnterMode:byte);
  end;

var
  frmEdit_Data0348: TfrmEdit_Data0348;

implementation
uses Main_167,common,constvar,MyClass;
{$R *.dfm}

{ TfrmEdit_Data0348 }

function TfrmEdit_Data0348.Check_Data_Before_Post: boolean;
var
  tmp:string;
  i: Integer;
  f: Extended;
begin
  tmp:='';
  result := true;
  i:=0;
  while Result do
  begin
    case i of
    0: result:= not ( trim(DBEdit1.Text)='');
    1: result:= not ( trim(Memo1.Text) = '');
    2: begin
         result:=trim(Memo1.Text)<>'';   // 计算成本 不能为空 最高最低可以为空
         if Result then
         Result:=Formula_Check(trim(Memo1.Text),frmMain_167.ADOConnection1,tmp);
       end;
    3: begin
         Result:=Formula_Check(trim(Memo2.Text),frmMain_167.ADOConnection1,tmp);
       end;
    4: begin
         Result:=Formula_Check(trim(Memo3.Text),frmMain_167.ADOConnection1,tmp);
       end;
    5: begin
         Result:=TryStrToFloat(DBEdit2.Text,f);
         if Result then
         Result:= (f>=0)  and (f<100);
       end;
    end;
    if not Result then
    case i of
    0: ShowMsg('请输入名称','提示',1);
    1: ShowMsg('请设置计算公式','提示',1);
    2: ShowMsg('计算成本公式无效，请重新设置','提示',1);
    3: ShowMsg('最低成本公式无效，请重新设置','提示',1);
    4: ShowMsg('最高成本公式无效，请重新设置','提示',1);
    5: ShowMsg('毛利率只能是小于100.00，大于等于0.00的值，请重新设置','提示',1);
    end;
    i:=i+1;
    if i>5 then Break;
  end;

  OutputDebugString(pchar(IntToStr(i)));
  if not Result then
  case i of
  1: DBEdit1.SetFocus;
  2: RadioButton1.Checked:=True;
  3: RadioButton1.Checked:=True;
  4: RadioButton2.Checked:=True;
  5: RadioButton3.Checked:=True;
  6: DBEdit2.SetFocus;
  end;

//
//
//  if trim(DBEdit1.Text)='' then
//  begin
//    ShowMsg('请输入名称','提示',1);
//    result := false;
//  end
//  else if trim(Memo1.Text) = '' then
//  begin
//    ShowMsg('请设置计算公式','提示',1);
//    result := false;
//  end
//  else
//  if not Formula_Check(trim(Memo1.Text),frmMain_167.ADOConnection1,tmp) then
//  begin
//    ShowMsg('计算成本公式无效，请重新设置','提示',1);
//    result := false;
//  end
//  else if trim(Memo2.Text)<>'' then
//  begin
//    if not Formula_Check(trim(Memo2.Text),frmMain_167.ADOConnection1,tmp) then
//    begin
//      ShowMsg('最低成本公式无效，请重新设置','提示',1);
//      result := false;
//    end;
//  end
//  else if trim(Memo3.Text)<>'' then
//  begin
//    if not Formula_Check(trim(Memo3.Text),frmMain_167.ADOConnection1,tmp) then
//    begin
//      ShowMsg('最高成本公式无效，请重新设置','提示',1);
//      result := false;
//    end;
//  end

end;

procedure TfrmEdit_Data0348.Enter(EnterMode: byte);
begin
  Run_Mode:= EnterMode;
  InitForm;
  if Run_Mode = em_Add then
  begin
  frmMain_167.adsMaster.Append;
  MyDataClass.OpenDataSetByPara(frmMain_167.adsMaster.fieldbyName('rkey').Asstring,adsParamList);
  end
  else if Run_Mode = em_browse then
  begin
  DBEdit1.ReadOnly:=true;
  DBCheckBox1.Enabled:=false;
  DBRadioGroup1.Enabled:=false;
  DBRadioGroup2.Enabled:=false;
  Combobox3.Enabled:=false;
  SpeedButton1.Enabled:=false;
  SpeedButton2.Enabled:=false;
  SpeedButton3.Enabled:=false;
  SpeedButton4.Enabled:=false;
  SpeedButton5.Enabled:=false;
  SpeedButton6.Enabled:=false;
  SpeedButton7.Enabled:=false;
  SpeedButton8.Enabled:=false;
  SpeedButton9.Enabled:=false;
  SpeedButton10.Enabled:=false;
  SpeedButton11.Enabled:=false;
  SpeedButton12.Enabled:=false;
  SpeedButton13.Enabled:=false;
  SpeedButton14.Enabled:=false;
  SpeedButton15.Enabled:=false;
  RadioButton1.Enabled:=false;
  RadioButton2.Enabled:=false;
  RadioButton3.Enabled:=false;
  Memo1.ReadOnly:=true;
  Memo2.ReadOnly:=true;
  Memo3.ReadOnly:=true;
  end;
  MyDataClass.OpenDataSetByPara(frmMain_167.adsMaster.fieldbyName('rkey').Asstring,adsParamList);
  Set_Run_Mode;
  Showmodal;
end;

procedure TfrmEdit_Data0348.InitForm;
var
  aqQuery:TAdoQuery;
begin
//  BtnCancel.Enabled:= BtnSave.Enabled;
  try
    aqQuery:= TadoQuery.Create(self);
    aqQuery.Connection := frmMain_167.ADOConnection1;
    Get_Eng_Table_Formula_List(aqQuery);
    aqQuery.First;
    while not aqQuery.Eof do begin
      Combobox3.Items.Add(aqQuery.fieldbyName('FXY').AsString);
      aqQuery.next;
    end;
  finally
    aqQuery.close;
    aqQuery.free;
  end;
end;

procedure TfrmEdit_Data0348.Set_Run_Mode;
begin
btnSave.Enabled:=Run_Mode<>em_Browse;
end;

procedure TfrmEdit_Data0348.RadioButton1Click(Sender: TObject);
begin
  Memo1.Enabled := true;
  Memo1.SetFocus;
  Memo2.Enabled := not Memo1.Enabled;
  RadioButton2.Checked := Memo2.Enabled;
  Memo3.Enabled := not Memo1.Enabled;
  RadioButton3.Checked := Memo3.Enabled;
end;

procedure TfrmEdit_Data0348.RadioButton2Click(Sender: TObject);
begin
  Memo2.Enabled := true;
  Memo2.SetFocus;
  Memo1.Enabled := not Memo2.Enabled;
  RadioButton1.Checked := Memo1.Enabled;
  Memo3.Enabled := not Memo2.Enabled;
  RadioButton3.Checked := Memo3.Enabled;
end;

procedure TfrmEdit_Data0348.RadioButton3Click(Sender: TObject);
begin
  Memo3.Enabled := true;
  Memo3.SetFocus;
  Memo1.Enabled := not Memo3.Enabled;
  RadioButton1.Checked := Memo1.Enabled;
  Memo2.Enabled := not Memo3.Enabled;
  RadioButton2.Checked := Memo2.Enabled;
end;

procedure TfrmEdit_Data0348.SpeedButton1Click(Sender: TObject);
var
  sp1,sp2:string;
  i,j:integer;
  symbol_txt:string;
begin
  frmMain_167.adsMaster.Edit;
  symbol_txt:=(Sender as TSpeedButton).Caption;
  if symbol_txt = 'IF' then
    symbol_txt := 'IF( , , )';
  if Radiobutton1.Checked then
  begin
    sp1:=' ';
    sp2:=' ';
    i:=Memo1.SelStart ;
    j:=Memo1.CaretPos.y;
    if copy(Memo1.Text,i,1)=' ' then sp1:='';
    if copy(Memo1.Text,i+1,1)=' ' then sp2:='';                         //i后面所有值
    memo1.Lines[j]:=copy(memo1.Lines[j],1,i)+sp1+trim(symbol_txt)+sp2+copy(memo1.Lines[j],i+1,length(memo1.Lines[j])-i);
    Memo1.SelStart:=i+1+length(sp1)+pos('(',trim(symbol_txt));
    Memo1.SelLength:=3;
    Memo1.SetFocus ;
  end else
  if Radiobutton2.Checked then
  begin
    sp1:=' ';
    sp2:=' ';
    i:=Memo2.SelStart ;
    j:=Memo2.CaretPos.y;
    if copy(Memo2.Text,i,1)=' ' then sp1:='';
    if copy(Memo2.Text,i+1,1)=' ' then sp2:='';
    Memo2.Lines[j]:=copy(Memo2.Lines[j],1,i)+sp1+trim(symbol_txt)+sp2+copy(Memo2.Lines[j],i+1,length(Memo2.Lines[j])-i);
    Memo2.SelStart:=i+1+length(sp1)+pos('(',trim(symbol_txt));
    Memo2.SelLength:=3;
    Memo2.SetFocus ;
  end else
  if Radiobutton3.Checked then
  begin
    sp1:=' ';
    sp2:=' ';
    i:=Memo3.SelStart ;
    j:=Memo3.CaretPos.y;
    if copy(Memo3.Text,i,1)=' ' then sp1:='';
    if copy(Memo3.Text,i+1,1)=' ' then sp2:='';
    Memo3.Lines[j]:=copy(Memo3.Lines[j],1,i)+sp1+trim(symbol_txt)+sp2+copy(Memo3.Lines[j],i+1,length(Memo3.Lines[j])-i);
    Memo3.SelStart:=i+1+length(sp1)+pos('(',trim(symbol_txt));
    Memo3.SelLength:=3;
    Memo3.SetFocus ;
  end;
end;

procedure TfrmEdit_Data0348.btnSaveClick(Sender: TObject);
begin
  if (frmMain_167.dsMaster.State in dsEditModes) then    //如果数据没有发生改变
  begin
    if not Check_Data_Before_Post then abort;
    with frmMain_167 do begin
  //数据赋值
  //1。启动事务
      try
        if not adsMaster.Connection.InTransaction then
          adsMaster.Connection.BeginTrans;
  //2。保存主表
        adsMaster.UpdateBatch(arAll);
  //3。保存子表
  //     (1).更新data0430
        if not Update_Eng_Param then abort;
       // (2)保存字表
  //      if not MyDataClass.UpdateValueToField(adsUpdate_Sub,adsUpdate_sub.fieldByName('rKey').value,'Parameter_ptr') then
  //        abort;
  //    (2).保存数据表
        adsUpdate_Sub.UpdateBatch(arAll);
        adsMaster.Connection.CommitTrans;  //提交事务
      except
        adsMaster.Connection.RollbackTrans; //回滚事务
        begin
          ShowMsg('保存数据失败，请检查!','警告',1);
          abort;
        end;
      end;
    end;
  end;
  close;
end;

function TfrmEdit_Data0348.Update_Eng_Param: boolean;
var
  vstring,vstring1:string;
begin
  result := true;
  try
    Adoquery1.close;
    Adoquery1.open;
    MyDataClass.OpenDataSetByPara(frmMain_167.adsMaster.fieldbyName('rkey').Value,adsUpdate_sub);
    vstring := AnsiUpperCase(' '+ Memo1.Text+' '+Memo2.Text+' '+Memo3.Text+' ');
    MyDataClass.DeleteTable(adsUpdate_Sub);
    Adoquery1.first;
    with Adoquery1 do
    while not eof do
    begin             //从data0278表中查放询比较(工程参数明细表)
      vstring1:=' '+AnsiUpperCase(trim(fieldbyname('Parameter_name').AsString))+' ';
{      if trim(vstring1) = 'SO_SET' then
        ShowMsg(vstring1,'aa',1);}
      if pos(vstring1,vstring)>0 then  
      begin
        adsUpdate_Sub.Append;      //关联0278
        adsUpdate_Sub.FieldByName('unit_ptr').asstring:= fieldbyname('rkey').asstring;
        adsUpdate_Sub.FieldByName('Source_ptr').asstring:= frmMain_167.adsMaster.fieldbyname('rkey').asstring;
      end;                       //关联主表0348
      next;
    end;
    Adoquery1.close;
//    MyDataClass.OpenDataSetByPara(frmMain_167.adsMaster.fieldbyName('rkey').Asstring,adsParamList);
  except
    result := false;
  end;
end;

procedure TfrmEdit_Data0348.SpeedButton15Click(Sender: TObject);
var
  tmp_value:string;
  sp1,sp2:string;
  i,j:integer;
begin
  tmp_value:= Pick_Eng_Param('',frmMain_167.ADOConnection1,2);
//  tmp_value:= Pick_Eng_Param_New('PNL_WTH',frmMain_167.ADOConnection1,2);
  if tmp_value <> '' then
  begin
    frmMain_167.adsMaster.Edit;
    if Radiobutton1.Checked then
    begin
      sp1:=' ';
      sp2:=' ';
      i:=Memo1.SelStart ;
      j:=Memo1.CaretPos.y;
      if copy(Memo1.Text,i,1)=' ' then sp1:='';
      if copy(Memo1.Text,i+1,1)=' ' then sp2:='';
      memo1.Lines[j]:=copy(memo1.Lines[j],1,i)+sp1+trim(tmp_value)+sp2+copy(memo1.Lines[j],i+1,length(memo1.Lines[j])-i);
      Memo1.SelStart:=i+length(sp1)+length(trim(tmp_value))+length(sp2);
      Memo1.SetFocus ;
    end else
    if Radiobutton2.Checked then
    begin
      sp1:=' ';
      sp2:=' ';
      i:=Memo2.SelStart ;
      j:=Memo2.CaretPos.y;
      if copy(Memo2.Text,i,1)=' ' then sp1:='';
      if copy(Memo2.Text,i+1,1)=' ' then sp2:='';
      Memo2.Lines[j]:=copy(Memo2.Lines[j],1,i)+sp1+trim(tmp_value)+sp2+copy(Memo2.Lines[j],i+1,length(Memo2.Lines[j])-i);
      Memo2.SelStart:=i+length(sp1)+length(trim(tmp_value))+length(sp2);
      Memo2.SetFocus ;
    end else
    if Radiobutton3.Checked then
    begin
      sp1:=' ';
      sp2:=' ';
      i:=Memo3.SelStart ;
      j:=Memo3.CaretPos.y;
      if copy(Memo3.Text,i,1)=' ' then sp1:='';
      if copy(Memo3.Text,i+1,1)=' ' then sp2:='';
      Memo3.Lines[j]:=copy(Memo3.Lines[j],1,i)+sp1+trim(tmp_value)+sp2+copy(Memo3.Lines[j],i+1,length(Memo3.Lines[j])-i);
      Memo3.SelStart:=i+length(sp1)+length(trim(tmp_value))+length(sp2);
      Memo3.SetFocus ;
    end;
  end;
end;

procedure TfrmEdit_Data0348.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain_167.adsMaster.Cancel;
  action := cafree;
  frmEdit_Data0348 := nil;
end;

procedure TfrmEdit_Data0348.FormShow(Sender: TObject);
begin
  RadioButton1.Checked:= true;
  DBEdit1.SetFocus;
//  RadioButton1Click(nil);
end;

procedure TfrmEdit_Data0348.Combobox3Change(Sender: TObject);
var
  sp1,sp2:string;
  i,j:integer;
begin
  frmMain_167.adsMaster.Edit;
  if Radiobutton1.Checked then
  begin
    sp1:=' ';
    sp2:=' ';
    i:=Memo1.SelStart ;
    j:=Memo1.CaretPos.y;
    if copy(Memo1.Text,i,1)=' ' then sp1:='';
    if copy(Memo1.Text,i+1,1)=' ' then sp2:='';
    memo1.Lines[j]:=copy(memo1.Lines[j],1,i)+sp1+trim(Combobox3.Text)+sp2+copy(memo1.Lines[j],i+1,length(memo1.Lines[j])-i);
    Memo1.SelStart:=i+1+length(sp1)+pos('(',trim(Combobox3.Text));
    Memo1.SelLength:=3;
    Memo1.SetFocus ;
  end else
  if Radiobutton2.Checked then
  begin
    sp1:=' ';
    sp2:=' ';
    i:=Memo2.SelStart ;
    j:=Memo2.CaretPos.y;
    if copy(Memo2.Text,i,1)=' ' then sp1:='';
    if copy(Memo2.Text,i+1,1)=' ' then sp2:='';
    Memo2.Lines[j]:=copy(Memo2.Lines[j],1,i)+sp1+trim(Combobox3.Text)+sp2+copy(Memo2.Lines[j],i+1,length(Memo2.Lines[j])-i);
    Memo2.SelStart:=i+1+length(sp1)+pos('(',trim(Combobox3.Text));
    Memo2.SelLength:=3;
    Memo2.SetFocus ;
  end else
  if Radiobutton3.Checked then
  begin
    sp1:=' ';
    sp2:=' ';
    i:=Memo3.SelStart ;
    j:=Memo3.CaretPos.y;
    if copy(Memo3.Text,i,1)=' ' then sp1:='';
    if copy(Memo3.Text,i+1,1)=' ' then sp2:='';
    Memo3.Lines[j]:=copy(Memo3.Lines[j],1,i)+sp1+trim(Combobox3.Text)+sp2+copy(Memo3.Lines[j],i+1,length(Memo3.Lines[j])-i);
    Memo3.SelStart:=i+1+length(sp1)+pos('(',trim(Combobox3.Text));
    Memo3.SelLength:=3;
    Memo3.SetFocus ;
  end;
end;

procedure TfrmEdit_Data0348.DBRadioGroup1Change(Sender: TObject);
begin
  Label2.Visible:= DBRadioGroup1.ItemIndex = 0;
  Label3.Visible:= DBRadioGroup1.ItemIndex = 0;
  Label4.Visible:= DBRadioGroup1.ItemIndex = 0;
end;

procedure TfrmEdit_Data0348.SpeedButton13Click(Sender: TObject);
begin
  if Radiobutton1.Checked then
    Memo1.clear
  else if Radiobutton2.Checked then
    Memo2.clear
  else
    Memo3.clear;
end;

procedure TfrmEdit_Data0348.SpeedButton14Click(Sender: TObject);
var strExpr:string;
tmp:string;
begin
  tmp:='';
  if Radiobutton1.Checked then
    strExpr:= Memo1.Text
  else if Radiobutton2.Checked then
    strExpr:= Memo2.Text
  else
    strExpr:= Memo3.Text;
  if not Formula_Check(strExpr,frmMain_167.ADOConnection1,tmp) then
    abort;
  ShowMsg('验证通过','提示',1);
end;

end.

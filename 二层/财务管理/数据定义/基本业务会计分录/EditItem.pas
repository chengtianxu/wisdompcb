unit EditItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, ADODB;

type
  TFRMEditItem = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    ADOQuery2: TADOQuery;
    ADOQuery1: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3exit(Sender: TObject);
    procedure Edit4exit(Sender: TObject);
    procedure Edit5exit(Sender: TObject);
    procedure Edit6exit(Sender: TObject);
    procedure Edit7exit(Sender: TObject);
    procedure Edit8exit(Sender: TObject);
    procedure Edit9exit(Sender: TObject);
    procedure Edit10exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     lab:string;
  end;

var
  FRMEditItem: TFRMEditItem;

implementation

uses accsearch, MAIN;
{$R *.dfm}

procedure TFRMEditItem.FormCreate(Sender: TObject);
begin
  adoquery1.Open;
  adoquery2.Open;

end;

procedure TFRMEditItem.Edit1Exit(Sender: TObject);
begin
  if sender=edit1 then
  begin
    if FrmEditItem.ActiveControl =BitBtn3 then exit;
  if trim(edit1.Text)='' then
  begin
  label26.Caption:='';
  end
else
 begin
   adoquery2.Close;
   frmedititem.ADOQuery2.Parameters[0].Value:=trim(edit1.text);
   adoquery2.Open;
    if frmedititem.ADOQuery2.RecordCount>0 then
    begin
      edit1.Text :=ADOQuery2.FieldValues['gl_acc_number'];
      label26.Caption :=ADOQuery2.FieldValues['gl_description'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_01').asinteger:=ADOQuery2.FieldValues['rkey'];
    end else
    begin
   messagedlg('输入的科目代码不正确!',mtinformation,[mbok],0);
    edit1.SetFocus ;
    end;
   end;
   end;
 end;

procedure TFRMEditItem.BitBtn4Click(Sender: TObject);
begin
 try
   frmaccsearch:=tfrmaccsearch.Create(application);
   frmaccsearch.Edit1.Text:=edit2.Text;
    if FrmAccSearch.ShowModal=mrok then
    begin
      edit2.Text :=FrmAccSearch.ADOQuery1.FieldValues['gl_acc_number'];
      label27.Caption :=FrmAccSearch.ADOQuery1.FieldValues['description_2'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_02').asinteger:=FrmAccSearch.ADOQuery1.FieldValues['rkey'];
    end;
  finally
   frmaccsearch.Free;
  end;
end;

procedure TFRMEditItem.BitBtn5Click(Sender: TObject);
begin
 try
   frmaccsearch:=tfrmaccsearch.Create(application);
   frmaccsearch.Edit1.Text:=edit3.Text;
    if FrmAccSearch.ShowModal=mrok then
    begin
      edit3.Text :=FrmAccSearch.ADOQuery1.FieldValues['gl_acc_number'];
      label28.Caption :=FrmAccSearch.ADOQuery1.FieldValues['description_2'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_03').asinteger:=FrmAccSearch.ADOQuery1.FieldValues['rkey'];
    end;
  finally
   frmaccsearch.Free;
  end;
end;

procedure TFRMEditItem.BitBtn6Click(Sender: TObject);
begin
 try
   frmaccsearch:=tfrmaccsearch.Create(application);
   frmaccsearch.Edit1.Text:=edit4.Text;
    if FrmAccSearch.ShowModal=mrok then
    begin
      edit4.Text :=FrmAccSearch.ADOQuery1.FieldValues['gl_acc_number'];
      label29.Caption :=FrmAccSearch.ADOQuery1.FieldValues['description_2'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_04').asinteger:=FrmAccSearch.ADOQuery1.FieldValues['rkey'];
    end;
  finally
   frmaccsearch.Free;
  end;
end;

procedure TFRMEditItem.BitBtn7Click(Sender: TObject);
begin
  try
   frmaccsearch:=tfrmaccsearch.Create(application);
   frmaccsearch.Edit1.Text:=edit5.Text;
    if FrmAccSearch.ShowModal=mrok then
    begin
      edit5.Text :=FrmAccSearch.ADOQuery1.FieldValues['gl_acc_number'];
      label30.Caption :=FrmAccSearch.ADOQuery1.FieldValues['description_2'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_05').asinteger:=FrmAccSearch.ADOQuery1.FieldValues['rkey'];
    end;
  finally
   frmaccsearch.Free;
  end;
end;

procedure TFRMEditItem.BitBtn8Click(Sender: TObject);
begin
 try
   frmaccsearch:=tfrmaccsearch.Create(application);
   frmaccsearch.Edit1.Text:=edit6.Text;
    if FrmAccSearch.ShowModal=mrok then
    begin
      edit6.Text :=FrmAccSearch.ADOQuery1.FieldValues['gl_acc_number'];
      label31.Caption :=FrmAccSearch.ADOQuery1.FieldValues['description_2'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_06').asinteger:=FrmAccSearch.ADOQuery1.FieldValues['rkey'];
    end;
  finally
   frmaccsearch.Free;
  end;
end;

procedure TFRMEditItem.BitBtn9Click(Sender: TObject);
begin
 try
   frmaccsearch:=tfrmaccsearch.Create(application);
   frmaccsearch.Edit1.Text:=edit7.Text;
    if FrmAccSearch.ShowModal=mrok then
    begin
      edit7.Text :=FrmAccSearch.ADOQuery1.FieldValues['gl_acc_number'];
      label32.Caption :=FrmAccSearch.ADOQuery1.FieldValues['description_2'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_07').asinteger:=FrmAccSearch.ADOQuery1.FieldValues['rkey'];
    end;
  finally
   frmaccsearch.Free;
  end;
end;

procedure TFRMEditItem.BitBtn10Click(Sender: TObject);
begin
 try
   frmaccsearch:=tfrmaccsearch.Create(application);
   frmaccsearch.Edit1.Text:=edit8.Text;
    if FrmAccSearch.ShowModal=mrok then
    begin
      edit8.Text :=FrmAccSearch.ADOQuery1.FieldValues['gl_acc_number'];
      label33.Caption :=FrmAccSearch.ADOQuery1.FieldValues['description_2'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_08').asinteger:=FrmAccSearch.ADOQuery1.FieldValues['rkey'];
    end;
  finally
   frmaccsearch.Free;
  end;
end;

procedure TFRMEditItem.BitBtn11Click(Sender: TObject);
begin
 try
   frmaccsearch:=tfrmaccsearch.Create(application);
   frmaccsearch.Edit1.Text:=edit9.Text;
    if FrmAccSearch.ShowModal=mrok then
    begin
      edit9.Text :=FrmAccSearch.ADOQuery1.FieldValues['gl_acc_number'];
      label34.Caption :=FrmAccSearch.ADOQuery1.FieldValues['description_2'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_09').asinteger:=FrmAccSearch.ADOQuery1.FieldValues['rkey'];
    end;
  finally
   frmaccsearch.Free;
  end;
end;

procedure TFRMEditItem.BitBtn12Click(Sender: TObject);
begin
 try
   frmaccsearch:=tfrmaccsearch.Create(application);
   frmaccsearch.Edit1.Text:=edit10.Text;
    if FrmAccSearch.ShowModal=mrok then
    begin
      edit10.Text :=FrmAccSearch.ADOQuery1.FieldValues['gl_acc_number'];
      label35.Caption :=FrmAccSearch.ADOQuery1.FieldValues['description_2'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_10').asinteger:=FrmAccSearch.ADOQuery1.FieldValues['rkey'];
    end;
  finally
   frmaccsearch.Free;
  end;
end;

procedure TFRMEditItem.Edit2Exit(Sender: TObject);
begin
    if FrmEditItem.ActiveControl =BitBtn4 then exit;
   if trim(edit2.Text)='' then
   label27.Caption:=''
   else
   begin
    adoquery2.Close;
    frmedititem.ADOQuery2.Parameters[0].Value:=trim(edit2.text);
    adoquery2.Open;
    if frmedititem.ADOQuery2.RecordCount>0 then
    begin
      edit2.Text :=ADOQuery2.FieldValues['gl_acc_number'];
      label27.Caption :=ADOQuery2.FieldValues['gl_description'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_02').asinteger:=ADOQuery2.FieldValues['rkey'];
   end else
    begin
      messagedlg('输入的科目代码不正确!',mtinformation,[mbok],0);
      edit2.SetFocus ;
    end;
   end;
 end;

procedure TFRMEditItem.Edit3exit(Sender: TObject);
begin
if sender=edit3 then
  begin
    if FrmEditItem.ActiveControl =BitBtn5 then exit;
    if trim(edit3.Text)='' then
   label28.Caption:=''
   else
   begin
    adoquery2.Close;
    frmedititem.ADOQuery2.Parameters[0].Value:=trim(edit3.text);
    adoquery2.Open;
    if frmedititem.ADOQuery2.RecordCount>0 then
    begin
      edit3.Text :=ADOQuery2.FieldValues['gl_acc_number'];
      label28.Caption :=ADOQuery2.FieldValues['gl_description'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_03').asinteger:=ADOQuery2.FieldValues['rkey'];
   end else
    begin
      messagedlg('输入的科目代码不正确!',mtinformation,[mbok],0);
      edit3.SetFocus ;
    end;
   end;
  end;
end;

procedure TFRMEditItem.Edit4exit(Sender: TObject);
begin
if sender=edit4 then
  begin
    if FrmEditItem.ActiveControl =BitBtn6 then exit;
   if trim(edit4.Text)='' then
   label29.Caption:=''
   else
   begin
     adoquery2.Close;
    frmedititem.ADOQuery2.Parameters[0].Value:=trim(edit4.text);
    adoquery2.Open;
    if frmedititem.ADOQuery2.RecordCount>0 then
    begin
      edit4.Text :=ADOQuery2.FieldValues['gl_acc_number'];
      label29.Caption :=ADOQuery2.FieldValues['gl_description'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_04').asinteger:=ADOQuery2.FieldValues['rkey'];
    end else
    begin
    messagedlg('输入的科目代码不正确!',mtinformation,[mbok],0);
      edit4.SetFocus ;
    end;
  end;
 end;
end;

procedure TFRMEditItem.Edit5exit(Sender: TObject);
begin
 if sender=edit5 then
  begin
    if FrmEditItem.ActiveControl =BitBtn7 then exit;
  if trim(edit5.Text)='' then
   label30.Caption:=''
   else
   begin
    adoquery2.Close;
    frmedititem.ADOQuery2.Parameters[0].Value:=trim(edit5.text);
    adoquery2.Open;
    if frmedititem.ADOQuery2.RecordCount>0 then
    begin
      edit5.Text :=ADOQuery2.FieldValues['gl_acc_number'];
      label30.Caption :=ADOQuery2.FieldValues['gl_description'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_05').asinteger:=ADOQuery2.FieldValues['rkey'];
    end else
    begin
      messagedlg('输入的科目代码不正确!',mtinformation,[mbok],0);
      edit5.SetFocus ;
    end;
  end;
 end;
end;

procedure TFRMEditItem.Edit6exit(Sender: TObject);
begin
if sender=edit6 then
  begin
    if FrmEditItem.ActiveControl =BitBtn8 then exit;
    if trim(edit6.Text)='' then
   label31.Caption:=''
   else
   begin
    adoquery2.Close;
    frmedititem.ADOQuery2.Parameters[0].Value:=trim(edit6.text);
    adoquery2.Open;
    if frmedititem.ADOQuery2.RecordCount>0 then
    begin
      edit6.Text :=ADOQuery2.FieldValues['gl_acc_number'];
      label31.Caption :=ADOQuery2.FieldValues['gl_description'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_06').asinteger:=ADOQuery2.FieldValues['rkey'];
    end else
    begin
      messagedlg('输入的科目代码不正确！',mtinformation,[mbok],0);
      edit6.SetFocus ;
    end;
  end;
 end;
end;

procedure TFRMEditItem.Edit7exit(Sender: TObject);
begin
 if sender=edit7 then
  begin
    if FrmEditItem.ActiveControl =BitBtn9 then exit;
   if trim(edit7.Text)='' then
   label32.Caption:=''
   else
   begin
   adoquery2.Close;
    frmedititem.ADOQuery2.Parameters[0].Value:=trim(edit7.text);
    adoquery2.Open;
    if frmedititem.ADOQuery2.RecordCount>0 then
    begin
      edit7.Text :=ADOQuery2.FieldValues['gl_acc_number'];
      label32.Caption :=ADOQuery2.FieldValues['gl_description'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_07').asinteger:=ADOQuery2.FieldValues['rkey'];
    end else
    begin
      messagedlg('输入的科目代码不正确！',mtinformation,[mbok],0);
      edit7.SetFocus ;
    end;
  end;
 end;
end;

procedure TFRMEditItem.Edit8exit(Sender: TObject);
begin
if sender=edit8 then
  begin
    if FrmEditItem.ActiveControl =BitBtn10 then exit;
  if trim(edit8.Text)='' then
   label33.Caption:=''
   else
   begin
  adoquery2.Close;
    frmedititem.ADOQuery2.Parameters[0].Value:=trim(edit8.text);
    adoquery2.Open;
    if frmedititem.ADOQuery2.RecordCount>0 then
    begin
      edit8.Text :=ADOQuery2.FieldValues['gl_acc_number'];
      label33.Caption :=ADOQuery2.FieldValues['gl_description'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_08').asinteger:=ADOQuery2.FieldValues['rkey'];
    end else
    begin
      messagedlg('输入的科目代码不正确！',mtinformation,[mbok],0);
      edit8.SetFocus ;
    end;
  end;
 end;
end;

procedure TFRMEditItem.Edit9exit(Sender: TObject);
begin
 if sender=edit9 then
  begin
    if FrmEditItem.ActiveControl =BitBtn11 then exit;
  if trim(edit9.Text)='' then
   label34.Caption:=''
   else
   begin
    adoquery2.Close;
    frmedititem.ADOQuery2.Parameters[0].Value:=trim(edit9.text);
    adoquery2.Open;
    if frmedititem.ADOQuery2.RecordCount>0 then
    begin
      edit9.Text :=ADOQuery2.FieldValues['gl_acc_number'];
      label34.Caption :=ADOQuery2.FieldValues['gl_description'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_09').asinteger:=ADOQuery2.FieldValues['rkey'];
    end else
    begin
      messagedlg('输入的科目代码不正确!',mtinformation,[mbok],0);
      edit9.SetFocus ;
    end;
  end;
 end;
end;

procedure TFRMEditItem.Edit10exit(Sender: TObject);
begin
if sender=edit10 then
  begin
    if FrmEditItem.ActiveControl =BitBtn12 then exit;
   if trim(edit10.Text)='' then
   label35.Caption:=''
   else
   begin
    adoquery2.Close;
    frmedititem.ADOQuery2.Parameters[0].Value:=trim(edit10.text);
    adoquery2.Open;
    if frmedititem.ADOQuery2.RecordCount>0 then
   begin
      edit10.Text :=ADOQuery2.FieldValues['gl_acc_number'];
      label35.Caption :=ADOQuery2.FieldValues['gl_description'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_10').asinteger:=ADOQuery2.FieldValues['rkey'];
    end else
    begin
      messagedlg('输入的科目代码不正确!',mtinformation,[mbok],0);
      edit10.SetFocus ;
   end;
 end;
end;
end;

procedure TFRMEditItem.BitBtn1Click(Sender: TObject);
begin
 modalresult:=mrok;
end;

procedure TFRMEditItem.BitBtn1Enter(Sender: TObject);
begin
 if  (trim(edit1.Text)='')and (edit1.Visible=true) then
  begin
  messagedlg('请输入科目编号',mtinformation,[mbok],0);
  edit1.SetFocus;
  end
 ELSE
 if (trim(edit2.Text)='')and (edit2.Visible=true) then
  begin
  messagedlg('请输入科目编号',mtinformation,[mbok],0);
  edit2.SetFocus;
  end
 ELSE
  if (trim(edit3.Text)='')and (edit3.Visible=true) then
  begin
  messagedlg('请输入科目编号',mtinformation,[mbok],0);
  edit3.SetFocus;
  end
 ELSE
 if(trim(edit4.Text)='')and (edit4.Visible=true) then
  begin
  messagedlg('请输入科目编号',mtinformation,[mbok],0);
  edit4.SetFocus;
  end
  ELSE
  if (trim(edit5.Text)='')and (edit5.Visible=true) then
  begin
  messagedlg('请输入科目编号',mtinformation,[mbok],0);
  edit5.SetFocus;
  end
  ELSE
   if(trim(edit6.Text)='') and (edit6.Visible=true) then
  begin
  messagedlg('请输入科目编号',mtinformation,[mbok],0);
  edit6.SetFocus;
  end
  ELSE
  if (trim(edit7.Text)='')and (edit7.Visible=true) then
  begin
  messagedlg('请输入科目编号',mtinformation,[mbok],0);
  edit7.SetFocus;
  end
 ELSE
  if (trim(edit8.Text)='')and (edit8.Visible=true) then
  begin
  messagedlg('请输入科目编号',mtinformation,[mbok],0);
  edit8.SetFocus;
  end
  ELSE
   if(trim(edit9.Text)='')and (edit9.Visible=true) then
  begin
  messagedlg('请输入科目编号',mtinformation,[mbok],0);
  edit9.SetFocus;
  end
 else
   if(trim(edit10.Text)='')and (edit10.Visible=true) then
  begin
  messagedlg('请输入科目编号',mtinformation,[mbok],0);
  edit10.SetFocus;
  end ;
end;

procedure TFRMEditItem.BitBtn3Click(Sender: TObject);
begin
 try
   frmaccsearch:=tfrmaccsearch.Create(application);
  // frmaccsearch.adoquery1.Close;
  // frmaccsearch.adoquery1.parameters[0].value:=lab;
  // frmaccsearch.adoquery1.Open;
   frmaccsearch.Edit1.Text:=trim(edit1.Text);
    if FrmAccSearch.ShowModal=mrok then
    begin
      edit1.Text :=FrmAccSearch.ADOQuery1.FieldValues['gl_acc_number'];
      label26.Caption :=FrmAccSearch.ADOQuery1.FieldValues['description_2'];
      FrmMain.adoquery1.edit;
      FrmMain.adoquery1.fieldbyname('dflt_acct_01').asinteger:=FrmAccSearch.ADOQuery1.FieldValues['rkey'];
    end;
  finally
   frmaccsearch.Free;
  end;
end;

procedure TFRMEditItem.BitBtn2Click(Sender: TObject);
begin
modalresult:=mrcancel;
end;

end.

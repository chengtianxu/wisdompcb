unit Frm_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ComCtrls,StrUtils, DBCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    mmo1: TMemo;
    Button1: TButton;
    Label8: TLabel;
    edtPCS: TEdit;
    Button2: TButton;
    ADOCon: TADOConnection;
    Label9: TLabel;
    Label11: TLabel;
    Edit9: TEdit;
    btn1: TButton;
    qrytmp: TADOQuery;
    adsOutBar: TADODataSet;
    adsOutBarpack_ptr: TIntegerField;
    adsOutBarorder_no: TSmallintField;
    adsOutBarMANU_PART_NUMBER: TStringField;
    adsOutBarMANU_PART_DESC: TStringField;
    adsOutBarANALYSIS_CODE_2: TStringField;
    adsOutBarPO_NUMBER: TStringField;
    adsOutBardescription: TStringField;
    adsOutBarcode: TStringField;
    adsOutBarqty: TIntegerField;
    adsOutBarlotno: TStringField;
    adsOutBarnotes: TStringField;
    adsOutBarbarcode_id: TStringField;
    adsOutBarCaseNo: TStringField;
    adsOutBarparam1: TStringField;
    adsOutBarParam2: TStringField;
    adsOutBarwo_ptr: TIntegerField;
    dbtxt1: TDBText;
    dsoutbar: TDataSource;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    mmo2: TMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lblHasCmp: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lblAllPrintTagNum: TLabel;
    lblUsePrintTagNum: TLabel;
    lbl6: TLabel;
    lblbaofeiTag: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure mmo1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FManuPartNumber: string;
    FTime: Cardinal;
    procedure Sqlopen(ASql: string);
    procedure SqlExec(ASql: string);
    procedure SaveCmpHis;
    procedure SaveCmpHisFalse(AErr: string = '');
  end;

var
  Form1: TForm1;

implementation
 uses common, MMSystem, CmpHisFrm;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init(ADOCon) then
  begin
    showmsg('程序起动失败,请与管理员联系!',1);
    application.Terminate;
  end;
  self.Caption:= application.Title;
//
//  with TResourceStream.Create(HInstance,'PASS' ,RT_RCDATA) do
//  begin
//    try
//      SaveToFile(ExtractFilePath(ParamStr(0)) + 'PASS.wav');
//    finally
//      Free;
//    end;
//  end;
//
//  with TResourceStream.Create(HInstance,'Alter' ,RT_RCDATA) do
//  begin
//    try
//      SaveToFile(ExtractFilePath(ParamStr(0)) + 'Alter.wav');
//    finally
//      Free;
//    end;
//  end;
//  with TResourceStream.Create(HInstance,'ERROR' ,RT_RCDATA) do
//  begin
//    try
//      SaveToFile(ExtractFilePath(ParamStr(0)) + 'ERROR.wav');
//    finally
//      Free;
//    end;
//  end;
//  ADOCon.Open;
//  user_ptr := '4';
//  vprev := '2';

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  lbl3.Caption := '';
  mmo1.Clear;
  mmo2.Clear;
  Edit1.SetFocus;
  edtPCS.Text:='0';
  Label11.Visible:=false;
  Edit9.Text:='';
  Edit9.Visible:=false;
  adsOutBar.Close;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  LRkey698,LID699: string;
  LBar: string;
  LSql: string;
begin
  if key=#13 then
  begin
    if Trim(Edit1.Text) = '' then exit;
    Label11.Visible:=false;

    LBar := Edit1.Text;
    LRkey698 := IntToStr(StrToIntDef(copy(LBar,1,Pos('-',LBar)-1),0));
    LID699 := IntToStr(StrToIntDef(Copy(LBar,Pos('-',LBar)+1,Length(LBar)-pos('-',LBar)),0));

    Sqlopen('select 1 FROM data0404 where rkey698 = ' + LRkey698+' AND id699 = '+lid699);
    lblHasCmp.Visible := not qrytmp.IsEmpty;

    adsOutBar.Close;
    adsOutBar.Parameters[0].Value := LRkey698;
    adsOutBar.Parameters[1].Value := LID699;
    adsOutBar.Open;


    //取得标签的打印数量和使用数量
    LSql := 'SELECT count(*) as no FROM DATA0699 d699 ' +
          ' inner JOIN DATA0698 d698 ON d698.rkey = d699.pack_ptr ' +
          ' WHERE MANU_PART_NUMBER = '+ QuotedStr(adsOutBar.fieldbyname('MANU_PART_NUMBER').AsString) +' AND v_date > DATEADD(DAY,-1,GETDATE()) ' +
          ' AND type=' + QuotedStr('内箱');

    Sqlopen(LSql);
    lblAllPrintTagNum.Caption := qrytmp.fieldbyname('no').AsString;

    LSql := 'SELECT count(*) as no FROM DATA0699 d699 ' +
          ' inner JOIN DATA0698 d698 ON d698.rkey = d699.pack_ptr ' +
          ' WHERE MANU_PART_NUMBER = '+ QuotedStr(adsOutBar.fieldbyname('MANU_PART_NUMBER').AsString) +' AND outpackkey <> 0 AND v_date > DATEADD(DAY,-1,GETDATE()) ' +
          ' AND type=' + QuotedStr('内箱');
    Sqlopen(LSql);
    lblUsePrintTagNum.Caption := qrytmp.fieldbyname('no').AsString;

    lblbaofeiTag.Caption := IntToStr(StrToIntdef(lblAllPrintTagNum.Caption,0)-
    StrToIntDef(lblUsePrintTagNum.Caption,0));



    if FTime <> 0 then
    begin
      if GetTickCount - FTime < 1000*120 then
      begin
        if FManuPartNumber <> dbtxt1.Caption then
        begin
          ShowMessage('型号不同，请间隔2分钟');
          Button2Click(Button2);
        end;
      end;
    end;

    if adsOutBar.IsEmpty then
    begin
      Label11.Caption:='警告：此外箱标签在数据库中不存在!';
      Label11.Font.Color:=clred;
      Label11.Visible:=true;
      Edit1.Text:='';
      Edit1.SetFocus;
    end else
    begin
      mmo1.Clear;
      mmo1.SetFocus;
      lbl3.Caption := adsOutBar.fieldbyname('CaseNo').AsString;
    end;
  end;
end;

procedure TForm1.mmo1KeyPress(Sender: TObject; var Key: Char);
var s:string;

    sedit1: string;
    sLeft,sRight,sOut,sIn: string;
    InQty: Integer;
    j: Integer;
    LNowTime: TDateTime;
    n,k: integer;
    LoutStr: string;
    LInStr: string;
    LInNum: string;

  LBar: string;
  I: Integer;
  LRkey698,LID699: string;
  LSql: string;
  LCaseNo: Integer;
  LTmpStr: string;
begin
  if Key <> #13 then Exit;

  if not adsOutBar.Active then
  begin
    Key := #0;
    sndPlaySound('ERROR.wav',SND_ASYNC);  
    ShowMessage('请先扫描外箱');
    mmo1.Lines.Delete(mmo1.Lines.Count-1);
    Exit;
  end;

  if adsOutBar.IsEmpty then
  begin
    Key := #0;
    sndPlaySound('ERROR.wav',SND_ASYNC);  
    ShowMessage('无效的外箱');
    mmo1.Lines.Delete(mmo1.Lines.Count-1);
    Exit;
  end;

  if adsOutBar.FieldByName('qty').AsInteger = StrToIntDef(edtPCS.Text,0) then
  begin
    Key := #0;
    sndPlaySound('ERROR.wav',SND_ASYNC);  
    ShowMessage('内箱数量外箱数量已经相等');
    mmo1.Lines.Delete(mmo1.Lines.Count-1);
    Exit;
  end;

  LBar := mmo1.Lines[mmo1.Lines.Count-1];
  if Trim(LBar) = '' then Exit;

  for J := 0 to mmo1.Lines.Count - 2 do
  begin
    if mmo1.Lines[j] = LBar then
    begin
      Key := #0;
      sndPlaySound('ERROR.wav',SND_ASYNC);
      ShowMessage('请勿重复扫描');
      mmo1.Lines.Delete(mmo1.Lines.Count-1);
      Exit;
    end;
  end;

  LRkey698 := IntToStr(StrToIntDef(copy(LBar,1,Pos('-',LBar)-1),0));
  LID699 := IntToStr(StrToIntDef(Copy(LBar,Pos('-',LBar)+1,Length(LBar)-pos('-',LBar)),0));
  if mmo1.lines.count > 1 then
  begin
    if StrToIntDef(LID699,0) + 1 <> StrToIntDef(Copy(mmo1.Lines[mmo1.Lines.Count-2],Pos('-',mmo1.Lines[mmo1.Lines.Count-2])+1,Length(mmo1.Lines[mmo1.Lines.Count-2])-pos('-',mmo1.Lines[mmo1.Lines.Count-2])),0) then
    begin
//      Key := #0;
//      sndPlaySound('ERROR.wav',SND_ASYNC);    
//      ShowMessage('请按从大到小顺序扫描内箱');
//      mmo1.Lines.Delete(mmo1.Lines.Count-1);
//      Exit;
    end;
  end;
  
  LSql := ' select data0699.* from data0699 ' +
          ' inner join data0698 on data0699.pack_ptr = data0698.rkey ' +
          ' where pack_ptr = ' + LRkey698 + ' and order_no = ' + LID699 + ' and data0698.type = ' + QuotedStr('内箱');
  Sqlopen(LSql);

  mmo2.Lines.Add(qrytmp.fieldbyname('CaseNo').AsString);
  LTmpStr := qrytmp.fieldbyname('CaseNo').AsString;

  LCaseNo := StrToIntDef(Copy(LTmpStr,Pos('-',LTmpStr)+1,Length(LTmpStr)-pos('-',LTmpStr)),0);
  if mmo2.lines.count > 1 then
  begin
    if LCaseNo + 1 <> StrToIntDef(Copy(mmo2.Lines[mmo2.Lines.Count-2],Pos('-',mmo2.Lines[mmo2.Lines.Count-2])+1,Length(mmo2.Lines[mmo2.Lines.Count-2])-pos('-',mmo2.Lines[mmo2.Lines.Count-2])),0) then
    begin
//      Key := #0;
//      sndPlaySound('ERROR.wav',SND_ASYNC);    
//      ShowMessage('请按从大到小顺序扫描内箱');
//      mmo1.Lines.Delete(mmo1.Lines.Count-1);
//      mmo2.Lines.Delete(mmo2.Lines.Count-1);
//      Exit;
    end;
  end;

  if qrytmp.IsEmpty then
  begin
    Key := #0;
    sndPlaySound('ERROR.wav',SND_ASYNC);  
    ShowMessage('无效的内箱');
    mmo1.Lines.Delete(mmo1.Lines.Count-1);
    mmo2.Lines.Delete(mmo2.Lines.Count-1);
    Exit;
  end;

  //开始对比
  if LeftStr(qrytmp.FieldByName('caseno').AsString,4) <> adsOutBar.FieldByName('caseno').AsString then
  begin
    Key := #0;
    sndPlaySound('ERROR.wav',SND_ASYNC);  
    ShowMessage('外箱号：' + adsOutBar.FieldByName('caseno').AsString + '  与 内箱号：' + qrytmp.FieldByName('caseno').AsString + '  不匹配');
    mmo1.Lines.Delete(mmo1.Lines.Count-1);
    mmo2.Lines.Delete(mmo2.Lines.Count-1);
    SaveCmpHisFalse;
    Exit;
  end;

  if qrytmp.FieldByName('manu_part_number').AsString <> adsOutBar.FieldByName('manu_part_number').AsString then
  begin
    Key := #0;
    sndPlaySound('ERROR.wav',SND_ASYNC);
    ShowMessage('内外箱本厂编号不匹配');
    mmo1.Lines.Delete(mmo1.Lines.Count-1);
    mmo2.Lines.Delete(mmo2.Lines.Count-1);
    SaveCmpHisFalse('本厂编号不匹配');
    Exit;
  end;
  if qrytmp.FieldByName('manu_part_desc').AsString <> adsOutBar.FieldByName('manu_part_desc').AsString then
  begin
    Key := #0;
    sndPlaySound('ERROR.wav',SND_ASYNC);  
    ShowMessage('内外箱客户型号不匹配');
    mmo1.Lines.Delete(mmo1.Lines.Count-1);
    mmo2.Lines.Delete(mmo2.Lines.Count-1);
    SaveCmpHisFalse('型号不匹配');
    Exit;
  end;
  if qrytmp.FieldByName('ANALYSIS_CODE_2').AsString <> adsOutBar.FieldByName('ANALYSIS_CODE_2').AsString then
  begin
    Key := #0;
    sndPlaySound('ERROR.wav',SND_ASYNC);  
    ShowMessage('内外箱客户物料号不匹配');
    mmo1.Lines.Delete(mmo1.Lines.Count-1);
    mmo2.Lines.Delete(mmo2.Lines.Count-1);
    SaveCmpHisFalse('客户物料号不匹配');
    Exit;
  end;
  if qrytmp.FieldByName('PO_NUMBER').AsString <> adsOutBar.FieldByName('PO_NUMBER').AsString then
  begin
    Key := #0;
    sndPlaySound('ERROR.wav',SND_ASYNC);  
    ShowMessage('内外箱客户订单号不匹配');
    mmo1.Lines.Delete(mmo1.Lines.Count-1);
    mmo2.Lines.Delete(mmo2.Lines.Count-1);
    SaveCmpHisFalse('订单号不匹配');
    Exit;
  end;
  if qrytmp.FieldByName('lotno').AsString <> adsOutBar.FieldByName('lotno').AsString then
  begin
    Key := #0;
    sndPlaySound('ERROR.wav',SND_ASYNC);  
    ShowMessage('内外箱批次号不匹配');
    mmo1.Lines.Delete(mmo1.Lines.Count-1);
    mmo2.Lines.Delete(mmo2.Lines.Count-1);
    SaveCmpHisFalse('批次号不匹配');
    Exit;
  end;

  if (StrToIntDef(edtPCS.Text,0) + qrytmp.FieldByName('qty').AsInteger) > adsOutBar.FieldByName('qty').AsInteger then
  begin
    Key := #0;
    sndPlaySound('ERROR.wav',SND_ASYNC);  
    Label11.Caption:='警告：内箱总数已经超过外箱数!';
    Label11.Font.Color:=clred;
    Label11.Visible:=true;
    mmo1.Lines.Delete(mmo1.Lines.Count-1);
    mmo2.Lines.Delete(mmo2.Lines.Count-1);
    Exit;
  end;

  edtPCS.Text := IntToStr(StrToIntDef(edtPCS.Text,0) + qrytmp.FieldByName('qty').AsInteger);

  if StrToIntDef(edtPCS.Text,0) = adsOutBar.FieldByName('qty').AsInteger then
  begin
    Label11.Caption:='提示：内箱总数已经等于外箱数!';
    Label11.Font.Color:=clgreen;
    Label11.Visible:=true;
    Edit9.Visible:=true;
    Edit9.SetFocus;
    mmo1.Font.Color := clGreen;
    sndPlaySound('PASS.wav',SND_ASYNC);

    SaveCmpHis;
  end;





(*
  if Edit7.Text=Edit6.Text then abort;
  if (Edit1.Tag<>0) and (key=#13) then
  begin
    Label11.Visible:=false;
    s:=Memo1.Lines[Memo1.Lines.Count-1];
    if Trim(s) = '' then Abort;
    for J := 0 to Memo1.Lines.Count - 2 do
    begin
      if Memo1.Lines[j] = s then
      begin
        ShowMessage('请勿重复扫描');
        Memo1.Lines.Delete(Memo1.Lines.Count-1);
        sndPlaySound('ERROR.wav',SND_ASYNC);
        Abort;
      end;
    end;
//    if memo1.lines.count > 1 then
//    begin
//      if (strtoint(rightstr(s,2))+1) <> strtoint(rightstr(memo1.lines[memo1.lines.count-2],2)) then
//      begin
//        ShowMessage('请按从大到小顺序扫描内箱');
//        Memo1.Lines.Delete(Memo1.Lines.Count-1);
//        sndPlaySound('ERROR.wav',SND_ASYNC);
//        Abort;
//      end;
//    end;
    if (not IsHWBarCode(Edit1.Text)) and (not IsHWBarCode(s)) then
    begin
      k := 0;
      for N := 1 to Length(Edit1.Text) do
      begin
        if Edit1.Text[n] =  '-' then
        begin
          k := k+1;
          if k = 3 then
          begin
            LoutStr := LeftStr(Edit1.Text,N);
          end;
          if k = 4 then
          begin
            LoutStr := LoutStr + Copy(Edit1.Text,N+1,4);
            Break;
          end;
        end;
      end;

      k := 0;
      for N := 1 to Length(s) do
      begin
        if s[n] =  '-' then
        begin
          k := k+1;
          if k = 3 then
          begin
            LInStr := LeftStr(s,N);
          end;
          if k = 4 then
          begin
            LInStr := LInStr + Copy(s,N+1,4);
            Break;
          end;
        end;
      end;      

      if LInStr <> LoutStr then
      //if (LeftStr(Edit1.Text,19) + Copy(Edit1.Text,24,10)) <> (LeftStr(s,19) + Copy(s,24,6) + '00' + Copy(s,30,2)) then
      begin
        Label11.Caption:='警告：内外箱型号不一致!';
        Label11.Font.Color:=clred;
        Label11.Visible:=true;
        Memo1.Lines.Delete(Memo1.Lines.Count-1);
        sndPlaySound('ERROR.wav',SND_ASYNC);
        Memo1.Font.Color := clRed;
        Abort;
      end;

      k := 0;
      for N := 1 to Length(s) do
      begin
        if s[n] =  '-' then
        begin
          k := k+1;
          Continue;
        end;

        if k = 3 then
        begin
          LInNum := LInNum + s[n];
        end;
      end;


      //i := StrToInt(Copy(s,20,4));
      i := StrToInt(LInNum);
      if strtoint(Edit7.Text)+i>strtoint(Edit6.Text) then
      begin
        Label11.Caption:='警告：内箱总数已经超过外箱数!';
        Label11.Font.Color:=clred;
        Label11.Visible:=true;
        Memo1.Lines.Delete(Memo1.Lines.Count-1);
        sndPlaySound('ERROR.wav',SND_ASYNC);
        Memo1.Font.Color := clRed;
        Abort;
      end;
      Edit7.Text:=inttostr(strtoint(Edit7.Text)+i);
      if strtoint(Edit7.Text)=strtoint(Edit6.Text) then
      begin
        Label11.Caption:='提示：内箱总数已经等于外箱数!';
        Label11.Font.Color:=clgreen;
        Label11.Visible:=true;
        Edit9.Visible:=true;
        Edit9.SetFocus;
        Memo1.Font.Color := clGreen;
        sndPlaySound('PASS.wav',SND_ASYNC);
        tmp.Close;
        tmp.SQL.Text := 'select getdate() as nowdatetime';
        tmp.Open;
        LNowTime := tmp.fieldbyname('nowdatetime').AsDateTime;
        ADOCon.BeginTrans;
        try
          tmp.Close;
          tmp.SQL.Text := 'select * from data0404 where rkey = -1';
          tmp.Open;
          tmp.Append;
          tmp.FieldByName('cmpUser').AsString := user_ptr;
          tmp.FieldByName('rkey698').AsString := FRkey698;
          tmp.FieldByName('id699').AsString := F699No;
          tmp.FieldByName('cmpDate').AsDateTime := LNowTime;
          tmp.Post;
          ADOCon.CommitTrans;
        finally
          if ADOCon.InTransaction then
            ADOCon.RollbackTrans;
        end;
        Abort;
      end ;
    end else
    begin
      sLeft := LeftStr(Trim(Edit1.Text),16);
      sRight := Copy(RightStr(Trim(Edit1.Text),10),1,4);
      sOut := sLeft + sRight;
      sLeft := LeftStr(Trim(s),16);
      sRight := Copy(RightStr(Trim(s),10),1,4);
      sIn := sLeft + sRight;
      if sOut <> sIn then
      begin
        Label11.Caption:='警告：内外箱型号不一致!';
        Label11.Font.Color:=clred;
        Label11.Visible:=true;
        Memo1.Lines.Delete(Memo1.Lines.Count-1);
        sndPlaySound('ERROR.wav',SND_ASYNC);
        Memo1.Font.Color := clRed;
        Abort;
      end;
      InQty := StrToInt((Copy(Trim(s),17,Length(Trim(s))-26)));
      if strtoint(Edit7.Text)+InQty>strtoint(Edit6.Text) then
      begin
        Label11.Caption:='警告：内箱总数已经超过外箱数!';
        Label11.Font.Color:=clred;
        Label11.Visible:=true;
        Memo1.Lines.Delete(Memo1.Lines.Count-1);
        sndPlaySound('ERROR.wav',SND_ASYNC);
        Memo1.Font.Color := clRed;
        Abort;
      end;
      Edit7.Text:=inttostr(strtoint(Edit7.Text)+InQty);
      if strtoint(Edit7.Text)=strtoint(Edit6.Text) then
      begin
        Label11.Caption:='提示：内箱总数已经等于外箱数!';
        Label11.Font.Color:=clgreen;
        Label11.Visible:=true;
        Edit9.Visible:=true;
        Edit9.SetFocus;
        Memo1.Font.Color := clGreen;
        sndPlaySound('PASS.wav',SND_ASYNC);
        tmp.Close;
        tmp.SQL.Text := 'select getdate() as nowdatetime';
        tmp.Open;
        LNowTime := tmp.fieldbyname('nowdatetime').AsDateTime;
        ADOCon.BeginTrans;
        try
          tmp.Close;
          tmp.SQL.Text := 'select * from data0404 where rkey = -1';
          tmp.Open;
          tmp.Append;
          tmp.FieldByName('cmpUser').AsString := user_ptr;
          tmp.FieldByName('rkey698').AsString := FRkey698;
          tmp.FieldByName('id699').AsString := F699No;
          tmp.FieldByName('cmpDate').AsDateTime := LNowTime;
          tmp.Post;
          ADOCon.CommitTrans;
        finally
          if ADOCon.InTransaction then
            ADOCon.RollbackTrans;
        end;
        Abort;
      end ;
    end;
  end;
  *)
end;

procedure TForm1.Edit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then Button2Click(nil);
end;

//function TForm1.IsHWBarCode(ABar: string): Boolean;
//begin
//  if (Pos('-',ABar) = 0) then
//    Result := True
//  else
//    Result := False;
//end;

procedure TForm1.btn1Click(Sender: TObject);
var
  LFrm: TfrmCmpHis;
begin
  LFrm := TfrmCmpHis.Create(Self);
  try
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TForm1.Sqlopen(ASql: string);
begin
  qrytmp.Close;
  qrytmp.SQL.Text := ASql;
  qrytmp.Open;
end;

procedure TForm1.SaveCmpHis;
var
  LNowTime: TDateTime;
  LBar: string;
  I: Integer;
  LRkey698,LID699: string;
  LSql: string;
begin
  FTime := GetTickCount;
  FManuPartNumber := dbtxt1.Caption;
  ADOCon.BeginTrans;
  try
    Sqlopen('select getdate() as nowdatetime');
    LNowTime := qrytmp.fieldbyname('nowdatetime').AsDateTime;

    //
    Sqlopen('select * from data0404 where rkey = -1');
    qrytmp.Append;
    qrytmp.FieldByName('cmpUser').AsString := user_ptr;
    qrytmp.FieldByName('rkey698').AsString := adsOutBar.fieldbyname('pack_ptr').AsString;
    qrytmp.FieldByName('id699').AsString := adsOutBar.fieldbyname('order_no').AsString;
    qrytmp.FieldByName('cmpDate').AsDateTime := LNowTime;
        qrytmp.FieldByName('cmpret').AsInteger := 1;
    qrytmp.Post;

    //
    for I := 0 to mmo1.Lines.Count - 1 do
    begin
      LBar := mmo1.Lines[I];
      LRkey698 := IntToStr(StrToIntDef(copy(LBar,1,Pos('-',LBar)-1),0));
      LID699 := IntToStr(StrToIntDef(Copy(LBar,Pos('-',LBar)+1,Length(LBar)-pos('-',LBar)),0));
      LSql := ' update data0699 set outpackkey = ' + adsOutBar.fieldbyname('pack_ptr').AsString +
              ' where pack_ptr = ' + LRkey698 + ' and order_no=' + LID699;
      SqlExec(LSql);
    end;
      LSql := ' update data0699 set outpackkey = ' + adsOutBar.fieldbyname('pack_ptr').AsString +
              ' where pack_ptr = ' + adsOutBar.fieldbyname('pack_ptr').AsString + ' and order_no=' +
              adsOutBar.fieldbyname('order_no').AsString;
      SqlExec(LSql);

    ADOCon.CommitTrans;
  finally
    if ADOCon.InTransaction then
      ADOCon.RollbackTrans;
  end;
end;

procedure TForm1.SqlExec(ASql: string);
begin
  qrytmp.Close;
  qrytmp.SQL.Text := ASql;
  qrytmp.ExecSQL;
end;

procedure TForm1.SaveCmpHisFalse(AErr: string = '');
var
  LNowTime: TDateTime;
begin
    Sqlopen('select getdate() as nowdatetime');
    LNowTime := qrytmp.fieldbyname('nowdatetime').AsDateTime;

    Sqlopen('select * from data0404 where rkey = -1');
    qrytmp.Append;
    qrytmp.FieldByName('cmpUser').AsString := user_ptr;
    qrytmp.FieldByName('rkey698').AsString := adsOutBar.fieldbyname('pack_ptr').AsString;
    qrytmp.FieldByName('id699').AsString := adsOutBar.fieldbyname('order_no').AsString;
    qrytmp.FieldByName('cmpDate').AsDateTime := LNowTime;
    qrytmp.FieldByName('cmpret').AsInteger := 0;
    qrytmp.FieldByName('cmpnote').AsString := AErr;
    qrytmp.Post;

end;

end.

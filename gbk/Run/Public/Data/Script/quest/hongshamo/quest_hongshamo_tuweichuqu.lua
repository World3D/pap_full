--ͻΧ��ȥ

--MisDescBegin
x205007_g_ScriptId = 205007
--x205007_g_MissionIdPre =40
x205007_g_MissionId = 47
x205007_g_MissionKind = 11
x205007_g_MissionLevel = 55
--x205007_g_ScriptIdNext = {ScriptId = 205007 ,LV = 1 }
x205007_g_Name	="Ҳ��" 
x205007_g_Name2	="����������" 
x205007_g_noDemandItem ={{id=13010007,num=1}}
x205007_g_DemandKill ={{id=305,num=20}}	

x205007_g_MissionName="ͻΧ��ȥ"
x205007_g_MissionInfo="    ���������������Ƿ񿴵��󺹵��ţ����ǲ����ٵ���ȥ�����ǵ�ʳ��͵�ˮ�ǳ����ޣ������ӵ���ԱԽ��Խ�࣡\n \n    Ϊ�����е���ʿ���̶ӵİ�ȫ�����Ѿ�������Ҫ����ͻΧ��׼��������󺹹�����������һ���˳е���\n \n    ���о�����Ҳ����Դ�ɳĮ�ģ�211��112����ͻΧ���������������õ��̻�������Ǹ�����#RɳĮ����#W������֮�󣬵�ȼ���#c0080C0�̻�#W��#R����������#W���Ӧ�㡣"  --��������
x205007_g_MissionTarget="    Ҳ���������������̻���ɳĮ�ģ�211��112����ͻΧ��ɱ��20��������#RɳĮ����#W���ȼ#c0080C0�̻�#W��Ȼ���#G����������#W��ͷ��"		
x205007_g_MissionComplete="    �ʴȵ����������뱣����Щ�������ѵ��˰ɡ�"					--�������npc˵���Ļ�
x205007_g_ContinueInfo="    ���ǵ�������Ļ��ڣ�ֻҪ���ܳɹ�ͻΧ��ȥ�����ǵĴ�������ͽ����Ź�������ǧ��ҪС�ġ�"
--������
x205007_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x205007_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x205007_g_RadioItemBonus={}

--MisDescEnd
x205007_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x205007_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x205007_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x205007_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x205007_g_MissionId)
		if x205007_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x205007_g_MissionName)
			AddText(sceneId,x205007_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x205007_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ��ɳĮ����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x205007_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x205007_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x205007_g_MissionName)
		     AddText(sceneId,x205007_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x205007_g_noDemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x205007_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x205007_g_ScriptId, x205007_g_MissionId)
                end

        elseif x205007_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x205007_g_MissionName)
                AddText(sceneId,x205007_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x205007_g_MissionTarget) 
		AddMoneyBonus(sceneId, x205007_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x205007_g_ScriptId, x205007_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x205007_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x205007_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x205007_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x205007_g_ScriptId, x205007_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x205007_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x205007_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x205007_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==5) then
        	if (GetName(sceneId,targetId)==x205007_g_Name) then
                 --if IsMissionHaveDone(sceneId, selfId, x205007_g_MissionIdPre) > 0 then
                    if IsHaveMission(sceneId,selfId, x205007_g_MissionId)<= 0 then
                    	return 1
                    end
                --end
        	end
        
		if (GetName(sceneId,targetId)==x205007_g_Name2) then
		    if IsHaveMission(sceneId,selfId, x205007_g_MissionId) > 0 then
		    	return 1
                    end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x205007_OnAccept(sceneId, selfId)

	BeginAddItem(sceneId)                                                    
	AddItem( sceneId,x205007_g_noDemandItem[1].id, x205007_g_noDemandItem[1].num )             
		ret = EndAddItem(sceneId,selfId)                                 
	        if ret > 0 then                                                  
	        	BeginEvent(sceneId)
			AddMission( sceneId, selfId, x205007_g_MissionId, x205007_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x205007_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)AddItemListToHuman(sceneId,selfId) 
	        else                                                             
		     BeginEvent(sceneId)                                      
		     AddText(sceneId,"��Ʒ����������������������")                    
		     EndEvent(sceneId)                                        
		     DispatchMissionTips(sceneId,selfId)                      
	        end           	         
		                                               
	     
end



--**********************************

--����

--**********************************

function x205007_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x205007_g_MissionId)
	for i, item in x205007_g_noDemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x205007_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x205007_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x205007_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x205007_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x205007_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x205007_g_MissionId)
		AddExp(sceneId, selfId, x205007_g_ExpBonus)
		AddMoney(sceneId, selfId, x205007_g_MoneyBonus)
		for i, item in x205007_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x205007_g_noDemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x205007_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x205007_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x205007_g_MissionId) >= 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x205007_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x205007_g_DemandKill[1].id then 
       		    if num < x205007_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ��ɳĮ����   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x205007_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x205007_OnEnterArea(sceneId, selfId, zoneId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x205007_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,1,1)

end

function x205007_OnLeaveArea(sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x205007_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)
end

function x205007_OnTimer(sceneId, selfId )

end



--**********************************

--���߸ı�

--**********************************

function x205007_OnItemChanged(sceneId, selfId, itemdataId)

end

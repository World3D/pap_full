--���ٵ���ʿ

--MisDescBegin
x206010_g_ScriptId = 206010
x206010_g_MissionIdPre =36
x206010_g_MissionId = 37
x206010_g_MissionKind = 8
x206010_g_MissionLevel = 40
x206010_g_ScriptIdNext = {ScriptId = 206011 ,LV = 1 }
x206010_g_Name	="����̨" 
x206010_g_Name2	="�����" 
x206010_g_Name3	="�����" 
x206010_g_Name4	="�����" 
x206010_g_DemandItem ={}
x206010_g_DemandKill ={{id=400,num=20}}

x206010_g_MissionName="���ٵ���ʿ"
x206010_g_MissionInfo="    ��Щ����治֪�����������˵����һ��Ĺ�������뻯�������ĵ��Ҹ��������ͣ���Ҳ�����ʶһ����Ĺ���\n \n    ǰ���һ��Ӫկ�ǽ����Ӫկ�����ڵ��Ƶ�ԭ������һֱ�޷�����������Σ��Ϳ�������ֶ��ˣ�\n \n    �����������Ҹ����ǳ�������Ӫկ�Ľ���#G�����#W��ֻϣ���ܰ����н�����ɲ���ɱ����"  --��������
x206010_g_MissionTarget="    ����̨����ȥɱ��20��#R�������#W��Ȱ˵#G�����#W����������Ͷ��Ͷ����"		                                                                                               
x206010_g_MissionComplete="     �콫��ֻ�����������ˣ����ѵ�������ǧ����������˲ţ������Ϊ�������ã������ǽ���ʵ��������\n \n    ����������ֻ��һ���ʱ�䡭��\n \n    �����������������Ŀ��ͣ�����������취�õ�������ʹ�ò�����Ҳ�����ñ��˵õ�������Ȼ�����\n \n    �Ҳ�ϣ����ʧһ��Ӣ�ۣ�"					--�������npc˵���Ļ�
x206010_g_ContinueInfo="    ������Ӫ�򵽾�ӹ�أ�ֻ�����Ӫկ�Ľ�����һ����ĺ��ӡ�"
x206010_g_MidInfo2="    ���������������ˣ��Ͱ�������ǧ�����Ū������������������������Ҳ�޺��ˣ��ϻ���˵���б��¾ͳ����������ץ�ң��ѵ����ǵ��ɹ������ֻ��JJYY��Ȱ����"
x206010_g_MidInfo3="    ��ʹ��˵�ٶ࣬����Ҳ�������ţ���ӹ��������֮�أ����������Ƕ������£�����ָ�����¾�ӹ�أ�"
x206010_g_MidInfo4="    �����������ˣ������콫������ʮ�꣬����ɭ�ϣ�����������ʿ�����������ٶ࣬����Ҳ������һ��üͷ��û���سǽ������˵ĺ�����Ǿ���ս����Ҳ�����뿪���"

--������
x206010_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x206010_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x206010_g_RadioItemBonus={}

--MisDescEnd
x206010_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x206010_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x206010_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x206010_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x206010_g_MissionId)
		if (GetName(sceneId,targetId)==x206010_g_Name) then
                	if x206010_CheckSubmit(sceneId, selfId, targetId) <= 0 then
	                        BeginEvent(sceneId)
				AddText(sceneId,"#Y"..x206010_g_MissionName)
				AddText(sceneId,x206010_g_ContinueInfo)
			        AddText(sceneId,"#Y����Ŀ��#W") 
				AddText(sceneId,x206010_g_MissionTarget) 
				AddText(sceneId,format("\n    ɱ���������   %d/%d\n    Ȱ˵�����   %d/1\n    Ȱ˵ʿ����   %d/1\n    Ȱ˵ʿ����   %d/1", GetMissionParam(sceneId,selfId,misIndex,0),x206010_g_DemandKill[1].num,GetMissionParam(sceneId,selfId,misIndex,1),GetMissionParam(sceneId,selfId,misIndex,2),GetMissionParam(sceneId,selfId,misIndex,3) ))
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
			else 
				BeginEvent(sceneId)
	                     	AddText(sceneId,"#Y"..x206010_g_MissionName)
			    	AddText(sceneId,x206010_g_MissionComplete)
			    	AddMoneyBonus(sceneId, x206010_g_MoneyBonus)
	                     	EndEvent()
			    	DispatchMissionContinueInfo(sceneId, selfId, targetId, x206010_g_ScriptId, x206010_g_MissionId)
	                end
	       elseif  (GetName(sceneId,targetId)==x206010_g_Name2) then
	       		SetMissionByIndex(sceneId,selfId,misIndex,1,1)
	        	BeginEvent(sceneId)
			AddText(sceneId,x206010_g_MidInfo2)
        		EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
			BeginEvent(sceneId)
			AddText(sceneId,format("Ȱ˵�����   %d/1", GetMissionParam(sceneId,selfId,misIndex,1) ))
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
	       elseif  (GetName(sceneId,targetId)==x206010_g_Name3) then
	       		SetMissionByIndex(sceneId,selfId,misIndex,2,1)
	        	BeginEvent(sceneId)
			AddText(sceneId,x206010_g_MidInfo3)
        		EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
			BeginEvent(sceneId)
			AddText(sceneId,format("Ȱ˵ʿ����   %d/1", GetMissionParam(sceneId,selfId,misIndex,2) ))
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			
	       elseif  (GetName(sceneId,targetId)==x206010_g_Name4) then
	       		SetMissionByIndex(sceneId,selfId,misIndex,3,1)
	        	BeginEvent(sceneId)
			AddText(sceneId,x206010_g_MidInfo4)
        		EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
			BeginEvent(sceneId)
			AddText(sceneId,format("Ȱ˵ʿ����   %d/1", GetMissionParam(sceneId,selfId,misIndex,3) ))
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
		end
	                

        elseif x206010_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x206010_g_MissionName)
                AddText(sceneId,x206010_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x206010_g_MissionTarget) 
		AddMoneyBonus(sceneId, x206010_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x206010_g_ScriptId, x206010_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x206010_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x206010_g_MissionId) > 0 then
		return 0
	end
	--����ѽӴ�����
	if  x206010_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x206010_g_ScriptId, x206010_g_MissionName)
	end
	return 0
	
end



--**********************************

--����������

--**********************************

function x206010_CheckAccept(sceneId, selfId, targetId)
	if IsMissionHaveDone(sceneId, selfId, x206010_g_MissionIdPre) > 0 then
		return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x206010_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==6) then
		misIndex = GetMissionIndexByID(sceneId,selfId,x206010_g_MissionId)  
        	if IsMissionHaveDone(sceneId, selfId, x206010_g_MissionIdPre) > 0 then
        		if (GetName(sceneId,targetId)==x206010_g_Name) then
        	        	return 1
        	        end
        	        if (GetName(sceneId,targetId)==x206010_g_Name2) then
        	        	if IsHaveMission(sceneId, selfId, x206010_g_MissionId) >= 0 then 
        	        		if GetMissionParam(sceneId,selfId,misIndex,1) <=0 then
        	        			return 1
        	        		end
        	        	end
        	        end
		 	if (GetName(sceneId,targetId)==x206010_g_Name3) then
        	        	if IsHaveMission(sceneId, selfId, x206010_g_MissionId) >= 0 then 
        	        		if GetMissionParam(sceneId,selfId,misIndex,2) <=0 then
        	        			return 1
        	        		end
        	        	end
        	        end	
        	        if (GetName(sceneId,targetId)==x206010_g_Name4) then
        	        	if IsHaveMission(sceneId, selfId, x206010_g_MissionId) >= 0 then 
        	        		if GetMissionParam(sceneId,selfId,misIndex,3) <=0 then
        	        			return 1
        	        		end
        	        	end
        	        end	
        	        	
        	end
        end
        return 0
		
end

--**********************************

--����

--**********************************

function x206010_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x206010_g_MissionId, x206010_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x206010_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x206010_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x206010_g_MissionId)
	for i, item in pairs(x206010_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x206010_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x206010_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x206010_g_DemandKill[1].num then
		if GetMissionParam(sceneId,selfId,misIndex,1) == 1 then
			if GetMissionParam(sceneId,selfId,misIndex,2) == 1 then
				if GetMissionParam(sceneId,selfId,misIndex,3) == 1 then
	        			return 1
	        		end
	        	end
	        end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x206010_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x206010_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x206010_g_MissionId)
		AddExp(sceneId, selfId, x206010_g_ExpBonus)
		AddMoney(sceneId, selfId, x206010_g_MoneyBonus)
		for i, item in pairs(x206010_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x206010_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x206010_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x206010_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x206010_g_MissionId) >= 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x206010_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0)
	 	 if objdataId == x206010_g_DemandKill[1].id then 
       		    if num < x206010_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ���������   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x206010_g_DemandKill[1].num ))
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x206010_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x206010_OnItemChanged(sceneId, selfId, itemdataId)

end


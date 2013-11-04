--����

--MisDescBegin
x223011_g_ScriptId = 223011
x223011_g_MissionIdPre =302
x223011_g_MissionId = 303
x223011_g_MissionKind = 20
x223011_g_MissionLevel = 100
--x223011_g_ScriptIdNext = {ScriptId = 223007 ,LV = 1 }
x223011_g_Name	="�ٲ�̨" 
x223011_g_DemandItem ={}
x223011_g_DemandKill ={{id=447,num=20}}

x223011_g_MissionName="����"
x223011_g_MissionInfo="    ���е���ʿ���������ǵĶ��䣬�����ҵĺ�������������ǵ���������֮�����������Ǵ��ɹŹ��Ĺ��硣��Щ�����翹���ղ�սʿ�����ܵ��������صĴ�����û����Ը�⿴���������������������ϵ��ҡ�\n \n    ���е���ʿ����������ǣ������е�#R�ղ���ʿ#W�������ǵ����أ�һ����ʣ��������ȥ����������Щ���ճ�Ϊ���ǵ�����"  --��������
x223011_g_MissionTarget="    ����#G�ٲ�̨#W����ȥ��Ӫɱ��20��#R�ղ���ʿ#W"		                                                                                               
x223011_g_MissionComplete="    ��ս���ϣ�û�����ܱ����Ǹ��ݸ����͵ģ�������ᱣ���κ�Ϊ���ɹŹ��������ˡ�"					--�������npc˵���Ļ�
x223011_g_ContinueInfo="    ���������������͵���Ѫ��ʨ��������������֮���������Ҵ��ɹŹ������£����Բ������κ��˷��ѣ���Ҫ��ס��һ�㣬ȥ�ɣ�������Щ�ղ���ʿ��"
--������
x223011_g_MoneyBonus = 500

--�̶���Ʒ���������8��
x223011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x223011_g_RadioItemBonus={}

--MisDescEnd
x223011_g_ExpBonus = 4000
--**********************************

--������ں���

--**********************************

function x223011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x223011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x223011_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x223011_g_MissionId)
		if x223011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x223011_g_MissionName)
			AddText(sceneId,x223011_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x223011_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ���ղ���ʿ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x223011_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x223011_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x223011_g_MissionName)
		     AddText(sceneId,x223011_g_MissionComplete)
		     AddMoneyBonus(sceneId, x223011_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x223011_g_ScriptId, x223011_g_MissionId)
                end

        elseif x223011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x223011_g_MissionName)
                AddText(sceneId,x223011_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x223011_g_MissionTarget) 
		AddMoneyBonus(sceneId, x223011_g_MoneyBonus)
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x223011_g_ScriptId, x223011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x223011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x223011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x223011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x223011_g_ScriptId, x223011_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x223011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x223011_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x223011_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==17) then
		if IsMissionHaveDone(sceneId, selfId, x223011_g_MissionIdPre) > 0 then
        	    	return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x223011_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x223011_g_MissionId, x223011_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x223011_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x223011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x223011_g_MissionId)
	for i, item in x223011_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x223011_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x223011_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x223011_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x223011_OnSubmit(sceneId, selfId, targetId, selectRadioId)
	if DelMission(sceneId, selfId, x223011_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x223011_g_MissionId)
		AddExp(sceneId, selfId, x223011_g_ExpBonus)
		AddMoney(sceneId, selfId, x223011_g_MoneyBonus)
		for i, item in x223011_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x223011_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x223011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x223011_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x223011_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x223011_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x223011_g_DemandKill[1].id then 
       		    if num < x223011_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ���ղ���ʿ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x223011_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x223011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x223011_OnItemChanged(sceneId, selfId, itemdataId)

end

